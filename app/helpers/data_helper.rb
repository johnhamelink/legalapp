module DataHelper

  def stakeholders(type, filter = {})
    @doc.document_stakeholders.where({stakeholder_type: type}.merge(filter))
  end

  def sender
    stakeholders(:sender).first
  end

  def client
    stakeholders(:client).first
  end

end
