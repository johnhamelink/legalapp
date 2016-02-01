module DocumentHelper

  # Replaces double newlines with <p> tags
  def paragraph_content(text)
    text = retrieve_match(text) if text.is_a?(Symbol)
    # Replace double newlines with </p><p>
    text.gsub!("\n\n", "</p><p>")
    # Replace empty <p></p> with nothing
    "<p>#{text}</p>".gsub(/<p>(\s*)<\/p>/,"").html_safe
  end

  def interpolate(text)
    return nil if text.nil?
    variable_regex = /{{[^}]+}}/
    # Find all the variables
    new_text = text.dup
    text.scan(variable_regex) do |matches|
      matches = [matches] unless matches.is_a?(Array)

      # For each match, replace with the value
      # of the variable that requested it.
      matches.each do |match|
        replacement = retrieve_match(match)
        replacement = "Error: Could not find value of #{match}" if replacement.nil?
        new_text.gsub!(match, replacement)
      end
    end

    new_text
  end

  def error_message(text)
    "<b>Error: #{text}</b>"
  end

  # TODO: Fix Stack level too deep error
  def retrieve_match(match)
    orig = match
    logger.info "Searching for match for #{match.inspect}"

    # Split query by '.' seperators
    match = match.gsub(/[{}]/,'').split('.') if match.is_a?(String)
    match = [match] unless match.is_a?(Array)

    # 1. Check for helpers that match and evaluate query
    if (respond_to?(match.first.to_sym))
      # Run method, then run attribute calls on top of it later on
      out = send(match.first.to_sym)
    end

    # 2. Check for key from Client Data
    out ||= @doc.client.client_data.find_by_key(match.first)

    return "Variable #{orig} not recognised" if out.nil?

    # 3. Traverse & we're done
    # Delete query segment which has already been processed
    match.delete_at(0)
    # If we have to traverse...
    if match.size > 0
      match.each do |part|
        # If we have a method that's called whatever
        # this segment is, then call it
        if out.respond_to?(part.to_sym)
          out = out.send(part.to_sym)
        # otherwise it's probably an attribute
        elsif out.respond_to?(:fetch) && (out.fetch(part.to_sym) != nil)
          out = out.fetch(part.to_sym)
        elsif out.respond_to? :get_attr
          out = out.get_attr(part)
        else
          out = nil
        end
      end
    end
    out = out.value if out.respond_to?(:value)

    logger.info "Result for #{orig.inspect} was: #{out.inspect}"
    return interpolate(out) unless out.nil?
    return nil
  end

end
