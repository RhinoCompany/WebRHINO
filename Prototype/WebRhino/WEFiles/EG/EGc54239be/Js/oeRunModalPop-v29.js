$(function(){ 
  if (WEInfoPage.RenderMode == 'Editor'){
    return 0;
  } 
  EGc54239be.Init(); 
});

var EGc54239be = {

	Init: function() {
		if (OEConfEGc54239be === undefined) return;
		var allElements = OEConfEGc54239be;

		for(var ID in allElements) {
			var $el = $('#'+ID); // le tag <div> principale de l'élément
			var properties = allElements[ID]; // les propriétés de l'élément disponibles pour JS
			this.InitElement(ID, $el, properties);
		}
	},

	InitElement: function(ID, $el, properties) {
		
        var currObj;
        var value;
		var Hidden_Elements_Id = [];  
        var Hidden_Elements_Id_numLines = properties.Hide_Element_List.length;
		for (var lineInd in properties.Hide_Element_List) { 
          currObj = properties.Hide_Element_List[lineInd];    
          for (var lField in currObj) {
            value = currObj[lField];
            if (value!==null){Hidden_Elements_Id.push(value.List[0]);} 
          } 
        }
      var Fade_Element_Id = [];
      var Fade_Element_Id_numLines = properties.Fade_Element_List.length;
          for (var lineInd in properties.Fade_Element_List) {
          currObj = properties.Fade_Element_List[lineInd]; 
          for (var lField in currObj) { 
             value = currObj[lField];
             if (value!==null){Fade_Element_Id.push(value.List[0]);} 
          }
        }
           
      var eltHeight= parseInt($el.height()); 
      var eltWidth= parseInt($el.width());
      var mainopen = '' ;
      var secondopen='' ;
      var secondclose='';
      if(properties.Main_Opening_Trigger!==null){if (properties.Main_Opening_Trigger.List.length !==0){mainopen=properties.Main_Opening_Trigger.List[0];}}
      if(properties.Second_Opening_Trigger!==null){if (properties.Second_Opening_Trigger.List.length !==0){secondopen=properties.Second_Opening_Trigger.List[0];}}
      if(properties.Close_Trigger!==null){if (properties.Close_Trigger.List.length !==0){secondclose=properties.Close_Trigger.List[0];}}
           
     OEPopUp.SlideTopLeft(ID,properties.Top, properties.Left,eltHeight,eltWidth,mainopen,secondopen,secondclose,Hidden_Elements_Id,Fade_Element_Id);    
      
	}

};


