class TreatmentGrid < Netzke::Basepack::GridPanel

  def configuration
    super.merge({
      :model => "Treatment",
      :persistence => true,
      :title => "Behandlung",

      :columns => [
        :id,
        { :name => :treatment_type__description, :header => "Behhandlung" },
        :name,
        { :name => :potency, :header => "Potenz" },
      ]
#      :bbar => [:add_in_form.action, :del.action]
    })
  end
end