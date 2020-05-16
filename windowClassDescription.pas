{$apptype windows}
unit windowClassDescription;

interface 

{$apptype windows}
{$reference 'System.Windows.Forms.dll'}
{$reference 'System.Drawing.dll'}
uses
 System.Windows.Forms, System, 
 System.Drawing;
 
 type
 Win = class(Form)
 procedure extermination (sender: Object; e: FormClosingEventArgs);
 private 
 Timer1: timer;
  end;

Implementation

procedure Win.extermination(sender: Object; e: FormClosingEventArgs);
begin
  Application.Exit;
end;

begin

end.