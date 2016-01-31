module DocumentHelper

  # Replaces double newlines with <p> tags
  def paragraph_content(text)
    # Replace double newlines with </p><p>
    text.gsub!("\n\n", "</p><p>")
    # Replace empty <p></p> with nothing
    "<p>#{text}</p>".gsub(/<p>(\s*)<\/p>/,"").html_safe
  end

  def interpolate(text, context)
    variable_regex = /{{[^}]+}}/
    # Find all the variables
    new_text = text.dup
    text.scan(variable_regex) do |matches|
      matches = [matches] unless matches.is_a?(Array)

      # For each match, replace with the value
      # of the variable that requested it.
      matches.each.with_index do |match, index|
        new_text.gsub!(match, retrieve_match(match, index))
      end
    end

    new_text
  end


  def retrieve_match(match, index)
    # Split them by '.' seperators
    query = match.gsub(/[{}]/,'').split('.')
    # The first one is an instance variable
    instance_var = "@#{query.first}".to_sym
    instance_var = instance_variable_get(instance_var)
    query.delete(query.first)

    # Query all the way down the list of parts
    if query.is_a?(Array) && query.size > 0
      query.each do |part|
        instance_var = instance_var[part]
      end
    end
    instance_var
  end

end
