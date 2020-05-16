{$apptype windows}
unit interfAddWindow;

interface 

{$apptype windows}
{$reference 'System.Windows.Forms.dll'}
{$reference 'System.Drawing.dll'}
uses
 System.Windows.Forms,
 System.Drawing, windowClassDescription;

var
 addText1, addText2, addText3, addText4, notificationDone: &label;
 addTextBox1, addTextBox2, addTextBox3, addTextBox4 : TextBox;
 addWin : Win;
 enterAddButton, backAddButton : Button;
Implementation

begin
  addWin:= new Win;
  addWin.Width := 500;
  addWin.Height := 700;
  addWin.BackColor := System.Drawing.Color.White;
  
  addText1 := new &label();
  addText1.Width := 450;
  addText1.Height := 30;
  addText1.Left := 10;
  addText1.Top := 10;
  addText1.Font := new Font('Tobota', 14, FontStyle.Bold);
  addText1.ForeColor := System.Drawing.Color.Black;
  addText1.Text := '1. Введите название новой записи:';
  
  addTextBox1 := new TextBox();
  addTextBox1.Width := 450;
  //mainTextBox.Height := 60;
  addTextBox1.Left := 10;
  addTextBox1.Top := 45;
  addTextBox1.Font := new Font('Tobota', 10, FontStyle.Italic);
  addTextBox1.ForeColor := System.Drawing.Color.Gray;
  addTextBox1.Text := 'Введите ключевое слово...';
  
  addText2 := new &label();
  addText2.Width := 450;
  addText2.Height := 30;
  addText2.Left := 10;
  addText2.Top := 100;
  addText2.Font := new Font('Tobota', 14, FontStyle.Bold);
  addText2.ForeColor := System.Drawing.Color.Black;
  addText2.Text := '2. Введите название блок-схемы:';
  
  addTextBox2 := new TextBox();
  addTextBox2.Width := 450;
  //mainTextBox.Height := 60;
  addTextBox2.Left := 10;
  addTextBox2.Top := 130;
  addTextBox2.Font := new Font('Tobota', 10, FontStyle.Italic);
  addTextBox2.ForeColor := System.Drawing.Color.Gray;
  addTextBox2.Text := 'Введите ключевое слово...';
  
  addText4 := new &label();
  addText4.Width := 450;
  addText4.Height := 50;
  addText4.Left := 10;
  addText4.Top := 190;
  addText4.Font := new Font('Tobota', 14, FontStyle.Bold);
  addText4.ForeColor := System.Drawing.Color.Black;
  addText4.Text := '3. Введите название картинки с примером кода:';
  
  addTextBox4 := new TextBox();
  addTextBox4.Width := 450;
  //mainTextBox.Height := 140;
  addTextBox4.Left := 10;
  addTextBox4.Top := 240;
  addTextBox4.Font := new Font('Tobota', 10, FontStyle.Italic);
  addTextBox4.ForeColor := System.Drawing.Color.Gray;
  addTextBox4.Text := 'Введите название картинки без расширения';
  
  addText3 := new &label();
  addText3.Width := 450;
  addText3.Height := 30;
  addText3.Left := 10;
  addText3.Top := 290;
  addText3.Font := new Font('Tobota', 14, FontStyle.Bold);
  addText3.ForeColor := System.Drawing.Color.Black;
  addText3.Text := '4. Введите обучающий текст к записи:';
  
  addTextBox3 := new TextBox();
  addTextBox3.AutoSize := false;
  addTextBox3.Multiline := true;
  addTextBox3.Width := 450;
  addTextBox3.Height := 140;
  addTextBox3.Left := 10;
  addTextBox3.Top := 330;
  addTextBox3.Font := new Font('Tobota', 10, FontStyle.Italic);
  addTextBox3.ForeColor := System.Drawing.Color.Gray;
  addTextBox3.ScrollBars := ScrollBars.Vertical;
  addTextBox3.Text := 'Пиши подробно...';
  
  enterAddButton := new Button();
  enterAddButton.Width := 220;
  enterAddButton.Height := 35;
  enterAddButton.Left := 240;
  enterAddButton.Top := 490;
  enterAddButton.ForeColor := System.Drawing.Color.White;
  enterAddButton.BackColor := Color.FromArgb(255,0,162,232);
  enterAddButton.Font := new Font('Tobota', 10);
  enterAddButton.Text := 'Создать новую запись';
  
  backAddButton := new Button();
  backAddButton.Width := 220;
  backAddButton.Height := 35;
  backAddButton.Left := 10;
  backAddButton.Top := 490;
  backAddButton.ForeColor := System.Drawing.Color.White;
  backAddButton.BackColor := Color.FromArgb(255,0,162,232);
  backAddButton.Font := new Font('Tobota', 10);
  backAddButton.Text := 'Назад';
  
  notificationDone := new &label();
  notificationDone.Width := 490;
  notificationDone.Height := 30;
  notificationDone.Left := 0;
  notificationDone.Top := 530;
  notificationDone.Font := new Font('Tobota', 10);
  notificationDone.ForeColor := System.Drawing.Color.Black;
  notificationDone.Visible := False;
  notificationDone.TextAlign := ContentAlignment.MiddleCenter;
  
  addWin.StartPosition := FormStartPosition.CenterScreen;
  
  addWin.Controls.Add(addText1);
  addWin.Controls.Add(addText2);
  addWin.Controls.Add(addText3);
  addWin.Controls.Add(addText4);
  addWin.Controls.Add(addTextBox1);
  addWin.Controls.Add(addTextBox2);
  addWin.Controls.Add(addTextBox3);
  addWin.Controls.Add(addTextBox4);
  addWin.Controls.Add(enterAddButton);
  addWin.Controls.Add(backAddButton);
  addWin.Controls.Add(notificationDone);
  //addWin.FormClosing += close;
  
end.