class CustomerGrid < Netzke::Basepack::GridPanel

  def configuration
    super.merge({
      :model => "Customer",
      :persistence => true,
      :lazy_loading => true,
      :title => "Kunden",

      :add_form_config => {
        :width => 400,
        :items => [
          :id,
          :name,
          {:name => :birthday, :format => "d.m.Y", :field_label => "Geburtstag"},
          {:name => :street, :field_label => "Strasse"},
          {:name => :areacode, :field_label => "PLZ", :width => 50},
          {:name => :city, :field_label => "Stadt"},
          {:name => :miasmic_type__typename, :field_label => "Myasma"}
        ]
      },
      :edit_form_config => {
        :width => 400,
        :items => [
          :id,
          :name,
          {:name => :birthday, :format => "d.m.Y", :field_label => "Geburtstag"},
          {:name => :street, :field_label => "Strasse"},
          {:name => :areacode, :field_label => "PLZ"},
          {:name => :city, :field_label => "Stadt"},
          {:name => :miasmic_type__typename, :field_label => "Myasma"}
        ]
      },
      :columns => [
        :id,
        :name,
        {:name => :birthday, :format => "d.m.Y", :header => "Geburtstag"},
        {:name => :street, :header => "Strasse"},
        {:name => :areacode, :header => "PLZ"},
        {:name => :city, :header => "Stadt"},
        {:name => :miasmic_type__typename, :header => "Myasma"},
        {
          :name => :created_at,
          :header => "erstellt am",
          :format => "d.m.Y H:i",
          :read_only => true
        },
        {
          :name => :updated_at,
          :header => "geaendert am",
          :format => "d.m.Y H:i",
          :read_only => true
        }
      ],
      :bbar => [:apply.action, :add_in_form.action, :edit_in_form.action, :del.action]
    })
  end
end