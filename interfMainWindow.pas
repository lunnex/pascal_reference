{$apptype windows}
unit interfMainWindow;



interface 

{$apptype windows}
{$reference 'System.Windows.Forms.dll'}
{$reference 'System.Drawing.dll'}
uses
 System.Windows.Forms, System, 
 System.Drawing, windowClassDescription;


var
 mainText1, mainText2, mainText3, mainText4, mainText5, mainText6, mainText7, mistakeLabel : &label;
 mainTextBox : TextBox;
 mainWin : Win;
 searchButton, showMeAllButton, newNoteButton, panelButton1, panelButton2, panelButton3, panelButton4, panelButton5, panelButton6 : Button;
 lepanel: panel;
 panelArray: array [1..6] of string;
 
  
Implementation

begin  
  mainWin := new Win;
  mainWin.Width := 500;
  mainWin.Height := 500;
  mainWin.BackColor := System.Drawing.Color.White;
  mainWin.BackColor := Color.FromArgb(255,245,245,245);
  mainWin.Text := 'Справочник по паскалю';
  
  lepanel := new Panel();
  panelButton1 := new Button();
  panelButton2 := new Button();
  panelButton3 := new Button();
  panelButton4 := new Button();
  panelButton5 := new Button();
  panelButton6 := new Button();
  lepanel.Location := new Point(60,195);
  lepanel.Size := new Size(350, 150);
  lepanel.BackColor := Color.FromArgb(255,245,245,245);
  
  //if keypressed = true then panelSearch (panelArray);
  
  panelButton1.Location := new Point (0,0);
  panelButton1.Size := new Size (350, 25);
  panelButton1.BackColor := Color.FromArgb(255,255,255,255);
  //panelButton1.Text := 'Test';
  panelButton1.FlatAppearance.BorderSize := 0;
  panelButton1.FlatStyle := FlatStyle.Flat;
  
  panelButton2.Location := new Point (0,25);
  panelButton2.Size := new Size (350, 25);
  panelButton2.BackColor := Color.FromArgb(255,255,255,255);
  //panelButton2.Text := panelArray[1];
  panelButton2.FlatAppearance.BorderSize := 0;
  panelButton2.FlatStyle := FlatStyle.Flat;
  
  panelButton3.Location := new Point (0,50);
  panelButton3.Size := new Size (350, 25);
  panelButton3.BackColor := Color.FromArgb(255,255,255,255);
  //panelButton3.Text := 'Test';
  panelButton3.FlatAppearance.BorderSize := 0;
  panelButton3.FlatStyle := FlatStyle.Flat;
  
  panelButton4.Location := new Point (0,75);
  panelButton4.Size := new Size (350, 25);
  panelButton4.BackColor := Color.FromArgb(255,255,255,255);
 // panelButton4.Text := 'Test';
  panelButton4.FlatAppearance.BorderSize := 0;
  panelButton4.FlatStyle := FlatStyle.Flat;
  
  panelButton5.Location := new Point (0,100);
  panelButton5.Size := new Size (350, 25);
  panelButton5.BackColor := Color.FromArgb(255,255,255,255);
 // panelButton5.Text := 'Test';
  panelButton5.FlatAppearance.BorderSize := 0;
  panelButton5.FlatStyle := FlatStyle.Flat;
  
  panelButton6.Location := new Point (0,125);
  panelButton6.Size := new Size (350, 25);
  panelButton6.BackColor := Color.FromArgb(255,255,255,255);
 // panelButton6.Text := 'Test';
  panelButton6.FlatAppearance.BorderSize := 0;
  panelButton6.FlatStyle := FlatStyle.Flat;
  
  
  mainWin.Controls.Add (lepanel);
  lepanel.Controls.Add (panelButton1);
  lepanel.Controls.Add (panelButton2);
  lepanel.Controls.Add (panelButton3);
  lepanel.Controls.Add (panelButton4);
  lepanel.Controls.Add (panelButton5);
  lepanel.Controls.Add (panelButton6);
  
  
  
  mainText1 := new &label();
  mainText1.Width := 500;
  mainText1.Height := 40;
  mainText1.Left := 100;
  mainText1.Top := 30;
  mainText1.Font := new Font('Tobota', 28, FontStyle.Bold);
  mainText1.ForeColor := System.Drawing.Color.Black;
  mainText1.Text := 'СПРАВОЧНИК';
  
  mainText2 := new &label();
  mainText2.Width := 500;
  mainText2.Height := 30;
  mainText2.Left := 175;
  mainText2.Top := 70;
  mainText2.Font := new Font('Tobota', 18, FontStyle.Bold);
  mainText2.ForeColor := System.Drawing.Color.Black;
  mainText2.Text := 'по паскалю';
  
  mainTextBox := new TextBox();
  mainTextBox.Width := 350;
  //mainTextBox.Height := 60;
  mainTextBox.Left := 60;
  mainTextBox.Top := 170;
  mainTextBox.Font := new Font('Tobota', 12, FontStyle.Italic);
  mainTextBox.ForeColor := System.Drawing.Color.Gray;
  mainTextBox.Text := 'Введите ключевое слово...';
  
  searchButton := new Button();
  searchButton.Width := 25;
  searchButton.Height := 25;
  searchButton.Left := 410;
  searchButton.Top := 170;
  searchButton.ForeColor := System.Drawing.Color.White;
  searchButton.Image := Image.FromFile('searchPic.bmp');
  searchButton.FlatAppearance.BorderSize := 0;
  searchButton.FlatStyle := FlatStyle.Flat;
  
  showMeAllButton := new Button();
  showMeAllButton.Width := 135;
  showMeAllButton.Height := 45;
  showMeAllButton.Left := 80;
  showMeAllButton.Top := 120;
  showMeAllButton.ForeColor := System.Drawing.Color.White;
  showMeAllButton.BackColor := Color.FromArgb(255,0,162,232);
  showMeAllButton.Font := new Font('Tobota', 10);
  showMeAllButton.Text := 'Покажи мне весь список!';
  //searchButton.ForeColor := System.Drawing.Color.White;
  //showMeAllButton.Image := Image.FromFile('searchPic.bmp');
  //showMeAllButton.FlatStyle := System.Windows.Forms.FlatStyle.Flat;
  
  newNoteButton := new Button();
  newNoteButton.Width := 135;
  newNoteButton.Height := 45;
  newNoteButton.Left := 260;
  newNoteButton.Top := 120;
  newNoteButton.ForeColor := System.Drawing.Color.White;
  newNoteButton.BackColor := Color.FromArgb(255,0,162,232);
  newNoteButton.Font := new Font('Tobota', 10);
  newNoteButton.Text := 'Создать новую запись';
  
  mistakeLabel := new &label();
  mistakeLabel.Top := 400;
  mistakeLabel.Left := 100;
  mistakeLabel.Width := 300;
  mistakeLabel.Height := 30;
  mistakeLabel.ForeColor := System.Drawing.Color.Red;
  mistakeLabel.Text := 'К сожалению, по вашему запросу ничего не найдено';
  //win1.Controls.Add(mistakeLabel);
  mistakeLabel.Visible := False;
  
  mainWin.StartPosition := FormStartPosition.CenterScreen;
  
  mainWin.Controls.Add(mainText1);
  mainWin.Controls.Add(mainText2);
  mainWin.Controls.Add(mainTextBox);
  mainWin.Controls.Add(showMeAllButton);
  mainWin.Controls.Add(newNoteButton);
  mainWin.Controls.Add(searchButton);
  mainWin.Controls.Add(mistakeLabel);
  mainWin.FormClosing += mainWin.extermination;
end.