{$apptype windows}
unit interfHelloWindow;



interface 

{$apptype windows}
{$reference 'System.Windows.Forms.dll'}
{$reference 'System.Drawing.dll'}
uses
 System.Windows.Forms,
 System.Drawing;

var
 text1, text2, text3, text4, text5, text6, text7 : &label;
 win1 : Form;
 b1 : Button;
Implementation
begin
  win1 := new Form();
  win1.Width := 500;
  win1.Height := 300;
  win1.BackColor := Color.FromArgb(255,245,245,245);
  Win1.StartPosition := FormStartPosition.CenterScreen;
  
  b1 := new Button;
  b1.Text:='Кнопка';
  b1.Width := 100;
  b1.Height := 50;
  b1.Left := 193;
  b1.Top := 120;
 // b1.Click += b1Click;
  
  text1 := new &label();
  text1.Width := 200;
  text1.Height := 30;
  text1.Left := 163;
  text1.Top := 10;
  text1.Font := new Font('Tobota', 14, FontStyle.Bold);
  text1.ForeColor := System.Drawing.Color.Black;
  text1.Text := 'Курсовая работа';
  
  text2 := new &label();
  text2.Width := 200;
  text2.Height := 20;
  text2.Left := 210;
  text2.Top := 40;
  text2.Font := new Font('Tobota', 8);
  text2.ForeColor := System.Drawing.Color.Black;
  text2.Text := 'По теме №1.8';
  
  text3 := new &label();
  text3.Width := 200;
  text3.Height := 25;
  text3.Left := 180;
  text3.Top := 55;
  text3.Font := new Font('Tobota', 14);
  text3.ForeColor := System.Drawing.Color.Black;
  text3.Text := '"Справочник"';
  
  text4 := new &label();
  text4.Width := 400;
  text4.Height := 60;
  text4.Left := 70;
  text4.Top := 90;
  text4.Font := new Font('Tobota', 10);
  text4.ForeColor := System.Drawing.Color.Black;
  text4.Text := 'Для продолжения нажмите на кнопку ниже или на Enter';  
  
  text5 := new &label();
  text5.Width := 400;
  text5.Height := 20;
  text5.Left := 219;
  text5.Top := 210;
  text5.Font := new Font('Tobota', 10);
  text5.ForeColor := System.Drawing.Color.Black;
  text5.Text := 'Рязань';
  
  text6 := new &label();
  text6.Width := 700;
  text6.Height := 50;
  text6.Left := 227;
  text6.Top := 230;
  text6.Font := new Font('Tobota', 8);
  text6.ForeColor := System.Drawing.Color.Black;
  text6.Text := '2020';
  
  text7 := new &label();
  text7.Width := 400;
  text7.Height := 50;
  text7.Left := 5;
  text7.Top := 245;
  text7.Font := new Font('Tobota', 7);
  text7.ForeColor := System.Drawing.Color.Black;
  text7.Text := 'Коротких Илья, 946';
  
end.