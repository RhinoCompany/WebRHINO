
var OEPopUp = {
  
  SlideTopLeft:function(ElemPanel, top, left, height, width,ElemOpen,ElemOpen2, ElemClose2, ListElemToHide, ListElemToOpacify){
  
      $ElemPanel=$('#'+ElemPanel);
      $ElemPanel.css('top',top);
      $ElemPanel.css('left',left);
      $ElemPanel.css('right','auto');
      $ElemPanel.css('bottom','auto');
 
 
      OEPopUp.Slide(ElemPanel, height, width, ElemOpen,ElemOpen2, ElemClose2, ListElemToHide, ListElemToOpacify);
    
  },
        
  Slide:function(ElemPanel,Elmheight, Elmwidth,ElemOpen, ElemOpen2, ElemClose2, ListElemToHide, ListElemToOpacify) {
    
    
    $ElemPanel=$('#'+ElemPanel);
    $ElemOpen=$('#'+ElemOpen);
    $ElemOpen2=$('#'+ElemOpen2);
    //$ElemClose1=$ElemPanel.find("#CloseZone");
    $ElemClose1= $ElemPanel.find('.OESZ_CloseZone:first');
    $ElemClose2 =$('#'+ElemClose2);
  
	$ElemPanel.css('height','0px');
	$ElemPanel.css('width','0px');
	$ElemPanel.css('opacity','0');
    
    $ElemPanel.css('z-index','0');
        
    var SelectorElemToHide='';
    var $ElemToHide =null;
    var ElemToHide; 
    for (ElemToHide in ListElemToHide) {SelectorElemToHide += "#" + ListElemToHide[ElemToHide] + ", ";}
    if (SelectorElemToHide !=='') {$ElemToHide = $(SelectorElemToHide);}
    
    var SelectorElemToOpacify='';
    var $ElemToOpacify =null;
    var ElemToOpacify;
    for (ElemToOpacify in ListElemToOpacify) {SelectorElemToOpacify += "#" + ListElemToOpacify[ElemToOpacify] + ", ";}
    if (SelectorElemToOpacify !=='') {$ElemToOpacify = $(SelectorElemToOpacify);}
    
    
    $ElemOpen.data("ElemPanel",$ElemPanel);
    $ElemOpen.data("ElemToHide",$ElemToHide);
    $ElemOpen.data("ElemToOpacify",$ElemToOpacify);
    
    $ElemOpen2.data("ElemPanel",$ElemPanel);
    $ElemOpen2.data("ElemToHide",$ElemToHide);
    $ElemOpen2.data("ElemToOpacify",$ElemToOpacify);
    
    $ElemClose1.data("ElemPanel",$ElemPanel);
    $ElemClose1.data("ElemToHide",$ElemToHide);
    $ElemClose1.data("ElemToOpacify",$ElemToOpacify);
    
    $ElemClose2.data("ElemPanel",$ElemPanel);
    $ElemClose2.data("ElemToHide",$ElemToHide);
    $ElemClose2.data("ElemToOpacify",$ElemToOpacify);
    
    $ElemOpen.click(function(e) {             
      
        $(this).data("ElemPanel").css('z-index','32001');
      
        $(this).data("ElemPanel").stop().animate({
			height:Elmheight,
			width:Elmwidth,
			opacity:'1'
		}, 500,'easeOutCirc');
	
        //Opacify SelectorElemToOpacify
		if ($(this).data("ElemToOpacify")!==null && $(this).data("ElemToOpacify").size()>0) {
            $(this).data("ElemToOpacify").stop().animate({
			opacity:'0.3'
          }, 500,'easeOutCirc');
        }
            
        // Mask ElemeToHide
      
        if ($(this).data("ElemToHide")!==null && $(this).data("ElemToHide").size()>0) { $(this).data("ElemToHide").fadeOut('fast');}
	});
	
	$ElemOpen2.click(function(e) {             
      
        $(this).data("ElemPanel").css('z-index','32001');
        
        $(this).data("ElemPanel").stop().animate({
			height:Elmheight,
			width:Elmwidth,
			opacity:'1'
		}, 500,'easeOutCirc');
	     
        //Opacify SelectorElemToOpacify
		if ($(this).data("ElemToOpacify")!==null && $(this).data("ElemToOpacify").size()>0) {
            $(this).data("ElemToOpacify").stop().animate({
			opacity:'0.3'
          }, 500,'easeOutCirc');
        }
            
        // Mask ElemeToHide
      
        if ($(this).data("ElemToHide")!==null && $(this).data("ElemToHide").size()>0) { $(this).data("ElemToHide").fadeOut('fast');}
	});
    
	$ElemClose1.click(function(e) {
        OEPopUp.ClosePanel($(this).data("ElemPanel"));
        if ($(this).data("ElemToHide")!==null && $(this).data("ElemToHide").size()>0) {$(this).data("ElemToHide").fadeIn('fast');}
        if ($(this).data("ElemToOpacify")!==null && $(this).data("ElemToOpacify").size()>0) {
              $(this).data("ElemToOpacify").stop().animate({
              opacity:'1'
            }, 500,'easeOutCirc');
          }
    });
    $ElemClose2.click(function(e) {
        OEPopUp.ClosePanel($(this).data("ElemPanel"));
        if ($(this).data("ElemToHide")!==null && $(this).data("ElemToHide").size()>0) {$(this).data("ElemToHide").fadeIn('fast');}
        if ($(this).data("ElemToOpacify")!==null &&$(this).data("ElemToOpacify").size()>0) {
              $(this).data("ElemToOpacify").stop().animate({
              opacity:'1'
            }, 500,'easeOutCirc');
          }
    });
    
  },

  OpenPanel:function(e,$ElemOpen){
    $ElemOpen.data("ElemPanel").css('z-index','32001');
        
        $ElemOpen.data("ElemPanel").stop().animate({
			height:Elmheight,
			width:Elmwidth,
			opacity:'1'
		}, 500,'easeOutCirc');
    
        //Opacify SelectorElemToOpacify
		if ($ElemOpen.data("ElemToOpacify")!==null && $ElemOpen.data("ElemToOpacify").size()>0) {
            $ElemOpen.data("ElemToOpacify").stop().animate({
			opacity:'0.3'
          }, 500,'easeOutCirc');
        }
      
      
        // Mask ElemeToHide
      
        if ($ElemOpen.data("ElemToHide")!==null && $ElemOpen.data("ElemToHide").size()>0) { $ElemOpen.data("ElemToHide").fadeOut('fast');}
  },
  
  
  ClosePanel:function($ElemPanel, $ElemPanelCadre) {
        $ElemPanel.css('z-index','0');
		
		$ElemPanel.stop().animate({
			height:'0px',
			width:'0px',
			opacity:'0'
			}, 500,'easeOutQuart');
		$ElemPanelCadre.stop().animate({
			height:'0px',
			width:'0px',
			opacity:'0'
			}, 500,'easeOutQuart');
  }
};