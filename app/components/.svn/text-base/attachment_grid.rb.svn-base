class AttachmentGrid < Netzke::Basepack::GridPanel

  def configuration
    super.merge({
      :model => "Attachment",
      :persistence => true,

      :add_form_config => {
        :class_name => "Netzke::Basepack::FormPanel",
        :file_upload => true,
        :items => [
          :id,
          :name,
          {:name => :document, :field_label => "Dokument", :xtype => :fileuploadfield, :getter => lambda {|r| ""}}
        ]
      },
      # Declaring columns
      :columns => [
        :id,
        :name,
        {
          :name => :created_at,
          :header => "Erstellungsdatum",
          :format => "d.m.Y"
        },{
          :name => :document,
          :field_label => "Link",
          :display_only => true,
          :getter => lambda {|r| %Q(<a href='#{r.document.url}' target='_blank'>Download</a>) if r.document.url}
        }
      ],
      :bbar => [:add_in_form.action, :del.action]
    })
  end
end