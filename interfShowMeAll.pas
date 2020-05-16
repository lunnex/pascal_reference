{$apptype windows}
unit interfShowMeAll;

interface 

{$apptype windows}
{$reference 'System.Windows.Forms.dll'}
{$reference 'System.Drawing.dll'}
uses
 System.Windows.Forms, System, 
 System.Drawing, windowClassDescription;

var
 showMeAllWin : Win;
 showMeAllPanel: panel;
 backShowMeAllButton: button;
 buttonArray: array [0..99] of button;
 position: integer;
   
Implementation
begin
  showMeAllWin := new Win;
  showMeAllWin.Width := 500;
  showMeAllWin.Height := 500;
  showMeAllWin.BackColor := System.Drawing.Color.White;
  showMeAllWin.BackColor := Color.FromArgb(255,245,245,245);
  showMeAllWin.Text := 'Справочник по паскалю';
  
  showMeAllPanel:= new Panel();
  showMeAllPanel.Location := new Point(60,15);
  showMeAllPanel.Size := new Size(380, 300);
  showMeAllPanel.BackColor := Color.FromArgb(255,255,255,255);
  showMeAllPanel.AutoScroll := True;
  showMeAllWin.Controls.Add (showMeAllPanel);
  
  backShowMeAllButton:= new Button();
  backShowMeAllButton.Location := new Point (60,350);
  backShowMeAllButton.Size := new Size (220, 35);
  backShowMeAllButton.ForeColor := System.Drawing.Color.White;
  backShowMeAllButton.BackColor := Color.FromArgb(255,0,162,232);
  backShowMeAllButton.Text := 'Назад';
  backShowMeAllButton.FlatAppearance.BorderSize := 0;
  backShowMeAllButton.FlatStyle := FlatStyle.Flat;
  showMeAllWin.Controls.Add (backShowMeAllButton);
  
end.