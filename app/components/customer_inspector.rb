class CustomerInspector < Netzke::Basepack::BorderLayoutPanel

  def default_config
    super.merge(:model => "Customer")
  end

  def configuration
    super.merge(
      :persistence => true,
      :session_persistence => true,
      :preventHeader => true,
      :items => [
        :customer_grid.component(:region => :west, :width => 150, :split => true, :title => "Kundenliste"),
        :customer_tab_panel.component(:region => :center, :header => false),
        :tab_panel.component(:region => :south, :split => true, :header => false)
      ]
    )
  end

  js_method :init_component, <<-JS
    function(){
      this.callParent();

      var customerView = this.getComponent('customer_grid').getView();
      var consultationGrid = this.getComponent('tab_panel').getComponent(0)

      // Disable addInForm Action
      consultationGrid.actions.addInForm.setDisabled(true);

      // Loeschen der Customer_id wenn die Componente angezeigt wird,
      // sonst werden die Termine des vormals selektierten Kunden angezeigt
      this.selectCustomer({customer_id: -1});
      consultationGrid.getStore().load();

      // When a row is clicked in the clerk grid, make the clerk form load the corresponding record
      customerView.on('itemclick', function(view, record){
        this.selectCustomer({customer_id: record.getId()});
        consultationGrid.actions.addInForm.setDisabled(false);
        this.getComponent('customer_tab_panel').getComponent(0).netzkeLoad({id: record.getId()});
        this.getComponent('customer_tab_panel').getComponent(1).netzkeLoad({id: record.getId()});
        consultationGrid.getStore().load();
        consultationGrid.store.sort('consultation_date', 'DESC');
      }, this);
    }
  JS

  endpoint :select_customer do |params|
    component_session[:selected_customer_id] = params[:customer_id]
  end

  component :customer_tab_panel do
    {
      :class_name => "Netzke::Basepack::TabPanel",
      :preventHeader => true,
      :items => [{
        :class_name => "Netzke::Basepack::FormPanel",
        :title => "Kunde",
        :model => "Customer",
        :items => [
          :id,
          :name,
          { :name => :birthday, :field_label => "Geburtstag", :format => "d.m.Y"},
          { :name => :street, :field_label => "Strasse"},
          { :name => :areacode, :field_label => "PLZ", :width => 50},
          { :name => :city, :field_label => "Stadt"},
          { :name => :miasmic_type__typename, :field_label => "Myasma"},
          { :name => :created_at, :field_label => "erstellt am", :read_only => true, :border => false, :format => "d.m.Y H:i" },
          { :name => :updated_at, :field_label => "geaendert am", :read_only => true, :format => "d.m.Y H:i"}
        ]
      },{
        :class_name => "Netzke::Basepack::FormPanel",
        :model => "Customer",
        :title => "Foto",
        :file_upload => true,
        :items => [
          :id,
          { :name => :name, :display_only => true },
          {
            :name => :image_area,
            :field_label => "Bild",
            :xtype => :displayfield,
            :display_only => true,
            :getter => lambda {|r| if r.customer_image.url then %Q(<img src='#{r.customer_image.url}'/>) else "" end}
          },{
            :name => :customer_image,
            :field_label => "Bild aendern",
            :xtype => :fileuploadfield,
            :getter => lambda {|r| ""},
            :display_only => true
          }
        ]
      }
      ],
      :width => 700,
      :border => true,
      :active_tab => 0
    }
  end

  component :tab_panel do
    {
      :class_name => "Netzke::Basepack::TabPanel",
      :preventHeader => true,
      :items => [{
        :class_name => "ConsultationGrid",
        :scope => {:customer_id => component_session[:selected_customer_id]},
  	    :strong_default_attrs => {:customer_id => component_session[:selected_customer_id]},
        :add_form_config => {
          :strong_default_attrs => {:customer_id => component_session[:selected_customer_id]},
          :width => 800,
          :items => [
            :id,
            { :name => :consultation_date, :field_label => "Datum", :format => "d.m.y"},
            { :name => :duration, :field_label => "Dauer  in Minuten"},
            { :name => :short_description, :field_label => "Kurzbeschreibung"},
            {
              :name => :description,
              :field_label => "Beschreibung",
              :xtype => "htmleditor"
            },
            { :name => :treatment__name, :field_label => "Behandlung"},
            { :name => :treatment_description, :field_label => "Behandlungsbeschreibung"},
            { :name => :treatment_success,
              :xtype => "combo",
              :field_label => "Behandlungserfolg",
              :store => [
                [ 1, '**** - Sehr gut' ],
                [ 2, ' *** - Gut'],
                [ 3, '  ** - Teilweise'],
                [ 4, '   * - Kaum'],
                [ 5, '     - Keiner']
              ]
            },
          ]
        }
      },{
        #TODO: nur die Attachments des Kunden anzeigen
        :class_name => "AttachmentGrid"
      }
      ],
      :width => 700,
      :border => true,
      :active_tab => 0
    }
  end

  component :customer_grid  do
    {
      :class_name => "Netzke::Basepack::GridPanel",
      :model => "Customer",
      :columns => [
          {:name => :name, :read_only => true},
          {:name => :street, :read_only => true},
          {:name => :birthday, :read_only => true, :format => "d.m.Y"}
      ],
      :bbar => [:search.action]
    }
  end

end