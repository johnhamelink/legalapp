class ExportController < ApplicationController

  def create
    unless @doc = Document.find_by_id(params[:document_id].to_i)
      render text: "Error: Could not find Document with ID '#{params[:document_id]}'"
      return
    end
    @template = @doc.document_template
    @reference_docx = "~/Downloads/reference.docx"

    respond_to do |format|
      format.docx {
        html_doc = render_to_string "document_templates/#{@template.view_key}.html"
        doc = PandocRuby.convert(
          html_doc,
          "reference-docx": @reference_docx,
          from: :html,
          to: :docx
        )

        send_data(doc,
                  filename: "#{@template.name.dasherize}.docx",
                  type: Mime::DOCX,
                  disposition: 'attachment')
      }

      format.html { render "document_templates/#{@template.view_key}" }
    end
  end

end
