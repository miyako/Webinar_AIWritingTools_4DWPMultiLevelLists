//%attributes = {}
#DECLARE($params : Object)

var $windowTitle : Text
$windowTitle:="Webinar 21 R4 - Demo"

var $window : Integer

If (Count parameters=0)
	
	ARRAY LONGINT($windows; 0)
	WINDOW LIST($windows)
	
	var $i : Integer
	For ($i; 1; Size of array($windows))
		$window:=$windows{$i}
		If (Window process($window)=1) && (Get window title($window)=$windowTitle)
			var $x; $y; $bottom; $right : Integer
			GET WINDOW RECT($x; $y; $bottom; $right; $window)
			CALL FORM($window; Formula(SET WINDOW RECT($x; $y; $bottom; $right; $window)))
			return 
		End if 
	End for 
	
	CALL WORKER(1; Current method name; {})
	
Else 
	
	SET MENU BAR(1)
	
	$window:=Open form window("MainWindow"; Plain form window; Horizontally centered; Vertically centered)
	SET WINDOW TITLE:C213($windowTitle; $window)
	DIALOG:C40("MainWindow"; *)
	
End if 
