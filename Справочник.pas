{$apptype windows}
{$reference 'System.Windows.Forms.dll'}
{$reference 'System.Drawing.dll'}
uses interfHelloWindow, funcModule, interfMainWindow, interfAddWindow,interfShowMeAll,
 System.Windows.Forms,
 System.Drawing;
 
begin

  win1.AcceptButton := searchButton;
  b1.Click += b1Click;
  newNoteButton.Click += addClick;
  MainTextBox.Click += clickMainTextBox;
  addTextBox1.Click += clickAddTextBox1;
  addTextBox2.Click += clickAddTextBox2;
  addTextBox3.Click += clickAddTextBox3;
  addTextBox4.Click += clickAddTextBox4;
  backAddButton.Click += clickBackAddButton;
  enterAddButton.Click += clickEnterAddButton;
  searchButton.Click += clickSearchButton;
  showMeAllButton.Click += clickShowMeAllButton;
  backShowMeAllButton.Click += clickBackShowMeAllButton;
  
  win1.Controls.Add(b1);
  win1.Controls.Add(text1);
  win1.Controls.Add(text2);
  win1.Controls.Add(text3);
  win1.Controls.Add(text4);
  win1.Controls.Add(text5);
  win1.Controls.Add(text6);
  win1.Controls.Add(text7);
  application.Run(win1);
end.