class ImageGalleryPanel < Netzke::Basepack::BorderLayoutPanel

  #TODO ImageGallery löschen darf nur gehen, wenn keine Bilder mehr vorhanden sind. Rails doku nachlesen, wie man das im Model hinterlegt

  def default_config
    super.merge(:model => "ImageGallery")
  end

  def configuration
    super.merge(
      :persistence => true,
      :session_persistence => true,
      :preventHeader => true,
      :items => [
        :gallery_grid.component(:region => :north, :split => true, :title => "Bildergallerien"),
        :image_entry_grid.component(:region => :center, :split => true, :title => "Bilder"),
        :image_entry_area.component(:region => :east, :split => true)
      ]
    )
  end

  js_method :init_component, <<-JS
    function(){
      this.callParent();

      var galleryGrid = this.getComponent('gallery_grid').getView();
      var imageEntryGrid = this.getComponent('image_entry_grid');
      var imageEntryArea =  this.getComponent('image_entry_area');

      // Loeschen der Customer_id wenn die Componente angezeigt wird,
      // sonst werden die Termine des vormals selektierten Kunden angezeigt
      this.selectGallery({image_gallery_id: -1});
      imageEntryGrid.getStore().load();

      // Disable addInForm Action
      imageEntryGrid.actions.addInForm.setDisabled(true);

      galleryGrid.on('itemclick', function(view, record){
        this.selectGallery({image_gallery_id: record.getId()});
        imageEntryGrid.getStore().load();
        // enable action as soon as a gallery gets selected
        imageEntryGrid.actions.addInForm.setDisabled(false);
        // hide ImageEntryArea, otherwise previously selected Image will remain visible
        imageEntryArea.hide();

      }, this);

      imageEntryGrid.on('itemclick', function(view, record){
        imageEntryArea.show();
        imageEntryArea.netzkeLoad({id: record.getId()});
      }, this);
    }
  JS

  endpoint :select_gallery do |params|
    component_session[:selected_gallery_id] = params[:image_gallery_id]
  end

  component :gallery_grid  do
    {
      :class_name => "Netzke::Basepack::GridPanel",
      :model => "ImageGallery",
      :columns => [
          {:name => :name },
          {:name => :customer__name}
      ],
    :bbar => [:search.action, :add_in_form.action, :edit_in_form.action, :del.action]
    }
  end

  component :image_entry_grid  do
    {
      :class_name => "Netzke::Basepack::GridPanel",
      :model => "ImageEntry",
      :title => "vorhandene Bilder",
      :scope => {:image_gallery_id => component_session[:selected_gallery_id]},
      :strong_default_attrs => {:image_gallery_id => component_session[:selected_gallery_id]},
      :columns => [
          :id,
          { :name => :description },
          { :name => :imagedate },
          { :name => :image_gallery__name, :display_only => true }
      ],
      :add_form_config => {
        :class_name => "Netzke::Basepack::FormPanel",
        :file_upload => true,
        :items => [
          :id,
          { :name => :description },
          { :name => :imagedate, :format => "d.m.Y" },
          {:name => :image, :field_label => "Bild", :xtype => :fileuploadfield, :getter => lambda {|r| ""}}
        ]
      },
      :bbar => [:search.action, :add_in_form.action, :del.action]
    }
  end

  component :image_entry_area do
    {
      :class_name => "Netzke::Basepack::FormPanel",
      :model => "ImageEntry",
      :preventHeader => true,
      :hidden => true,
      :items => [
        :id,
        {
          :name => :image_area,
          :field_label => "",
          :xtype => :displayfield,
          :getter => lambda {|r| if r.image.url then "<img src='#{r.image.url}'/>" else "" end}
        }
      ]
    }
  end
end