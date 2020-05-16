//Модуль со всеми процедурами программы 
unit funcModule;

interface
{$apptype windows}
{$reference 'System.Windows.Forms.dll'}
{$reference 'System.Drawing.dll'}
uses
  System.Windows.Forms, interfMainWindow, interfHelloWindow, interfAddWindow, interfShowMeAll,
  System.Drawing, System.IO, System.Linq, PABCSystem;


type
  searchResults = array of string;
  panelSearchResults = array of string;
  Win = Form;

var
  onPanelSearchResults: panelSearchResults;
  panelSearchString: string;
  Timer1: timer;
  panelStringToSearch: array [0..5] of string;
  allList: array of string;
  allListDir: array of string;
  fName: string;
  deleteButton: array [0..100] of Button;
//z: integer;


procedure b1Click(sender: object; e: system.eventargs);
procedure clickMainTextBox(sender: object; e: system.eventargs);
procedure clickAddTextBox1(sender: object; e: system.eventargs);
procedure clickAddTextBox2(sender: object; e: system.eventargs);
procedure clickAddTextBox3(sender: object; e: system.eventargs);
procedure addClick(sender: object; e: system.eventargs);
procedure clickBackAddButton(sender: object; e: system.eventargs);
procedure clickEnterAddButton(sender: object; e: system.eventargs);
procedure addNewNote(name, nameFlowchart, note: string);
procedure clickSearchButton(sender: object; e: system.eventargs);
procedure search(var request: string; var options: searchResults);
procedure panelSearch(sender: object; e: system.eventargs);
procedure correctionString(var inputArray: array of string; var outputArray: array of string);
procedure clickPanelButton1(sender: object; e: system.eventargs);
procedure clickPanelButton2(sender: object; e: system.eventargs);
procedure clickPanelButton3(sender: object; e: system.eventargs);
procedure clickPanelButton4(sender: object; e: system.eventargs);
procedure clickPanelButton5(sender: object; e: system.eventargs);
procedure clickPanelButton6(sender: object; e: system.eventargs);
procedure clickDeleteShowMeAllInsidePanel(sender: object; e: system.eventargs);
procedure clickShowMeAllInsidePanel(sender: object; e: system.eventargs);
procedure clickShowMeAllButton(sender: object; e: system.eventargs);
procedure clickAddTextBox4(sender: object; e: system.eventargs);
procedure clickBackShowMeAllButton(sender: object; e: system.eventargs);

implementation

procedure clickMainTextBox;
begin
  if (mainTextBox.Text = 'Введите ключевое слово...')  then
  begin;
    mainTextBox.clear();
    mainTextBox.Font := new Font('Tobota', 12);
    mainTextBox.ForeColor := System.Drawing.Color.Black;
  end;
end;

procedure clickAddTextBox1;
begin
  if (addTextBox1.Text = 'Введите ключевое слово...') then
  begin;
    addTextBox1.clear();
    addTextBox1.Font := new Font('Tobota', 12);
    addTextBox1.ForeColor := System.Drawing.Color.Black;
  end;
end;

procedure clickAddTextBox2;
begin
  if (addTextBox2.Text = 'Введите ключевое слово...')  then
  begin;
    addTextBox2.clear();
    addTextBox2.Font := new Font('Tobota', 12);
    addTextBox2.ForeColor := System.Drawing.Color.Black;
  end;
end;

procedure clickAddTextBox3;
begin
  if (addTextBox3.Text = 'Пиши подробно...') then
  begin;
    addTextBox3.clear();
    addTextBox3.Font := new Font('Tobota', 12);
    addTextBox3.ForeColor := System.Drawing.Color.Black;
  end;
end;

procedure clickAddTextBox4;
begin
  if (addTextBox4.Text = 'Введите название картинки без расширения') then
  begin;
    addTextBox4.clear();
    addTextBox4.Font := new Font('Tobota', 12);
    addTextBox4.ForeColor := System.Drawing.Color.Black;
  end;
end;

procedure b1Click;
begin
  win1.Visible := False;
  mainWin.ShowDialog();
  //Win.extermination();
end;

procedure addClick;
begin
  mainWin.Visible := False;
  addWin.ShowDialog();
end;

procedure clickBackAddButton;
begin
  addWin.Visible := false;
  mainWin.Visible := true;  
  //Application.Exit;
end;

procedure addNewNote;
var
  pass, passFlowchart, codePicName: string;
  newNote: text;
begin
  pass := ('Notes\' + name + '.txt');
  passFlowchart := ('Flowcharts\' + nameFlowchart + '.png');
  codePicName := ('codeExamples\' + addTextBox4.Text + '.png');
  
  if (codePicName = 'codeExamples\.png') or (codePicName = 'codeExamples\Введите название картинки без расширения.png') then begin
    codePicName := 'codeExamples\sad.jpg'
  end;
  
  if (passFlowchart = 'Flowcharts\.png') or (passFlowchart = 'Flowcharts\Введите ключевое слово....png') then begin
    passFlowchart := 'Flowcharts\sad.jpg'
  end;
  assign(newNote, pass);
  rewrite(newNote);
  writeln(newNote, passFlowchart);
  writeln(newNote, codePicName);
  write(newNote, note);
  close(newNote);
end;

procedure clickEnterAddButton;
var
  notificationString: string;
begin
  addNewNote(addTextBox1.Text, addTextBox2.Text, addTextBox3.Text);
  notificationString := 'Запись "' + addTextBox1.Text + '" сохранена!';
  addTextBox1.Clear();
  addTextBox2.Clear();
  addTextBox3.Clear();
  addTextBox4.Clear();
  notificationDone.Text := notificationString;
  notificationDone.Visible := True;
end;

procedure clickSearchButton;
var
  z: integer;
  searchRes: array of string;
  str, resStr, fileName, flowchartName, nameOfCodeEx: string;
  form2: Form;
  resultLabel: &label;
  f: text;
  pic, picCode: PictureBox;
begin
  str := mainTextBox.Text;
  search(str, searchRes);
  
  mistakeLabel.Visible := False;
  
  if (searchRes.Length <> 0) then begin
    
    fileName := searchRes[0];
    assign(f, fileName);
    reset(f);
    readln(f, flowchartName);
    while not eof(f) do
    begin
      if (z = 1) then readln(f, nameOfCodeEx);
      if (z = 2) then readln(f, resStr);
      z := z + 1;
    end;
    
    form2 := new Form();
    form2.Width := 1130;
    form2.Height := 660;
    
    resultLabel := new &label();
    resultLabel.Width := 280;
    resultLabel.Height := 600;
    resultLabel.Left := 410;
    resultLabel.Top := 10;
    resultLabel.Text := resStr;
    resultLabel.Font := new Font('Tobota', 10);
    resultLabel.ForeColor := System.Drawing.Color.Black;
    resultLabel.BackColor := Color.FromArgb(255, 255, 255, 255);
    form2.Controls.Add(resultLabel);
    
    picCode := new PictureBox();
    picCode.Location := new Point(10, 10);
    picCode.Width := 390;
    picCode.Height := 600;
    picCode.BackColor := Color.FromArgb(255, 255, 255, 255);
    picCode.Image := Image.FromFile(nameOfCodeEx);
    picCode.SizeMode :=  PictureBoxSizeMode.Zoom;
    form2.Controls.Add(picCode);
    //form2.ShowDialog();
    //resStr := nil;
    //fileName := nil;
    
    pic := new PictureBox();
    pic.Location := new Point(700, 10);
    pic.Width := 400;
    pic.Height := 600;
    pic.BackColor := Color.FromArgb(255, 255, 255, 255);
    pic.Image := Image.FromFile(flowchartName);
    pic.SizeMode :=  PictureBoxSizeMode.Zoom;
    form2.Controls.Add(pic);
    form2.ShowDialog();
    resStr := nil;
    fileName := nil;
  end
  else begin
    mistakeLabel.Visible := True;
  end;
end;

procedure search;
begin
  request := request + '.txt';
  options := Directory.GetFiles('Notes', request);
end;

procedure correctionString;
var
  i: byte;
begin
  for i := 0 to (inputArray.Length - 1) do
  begin
    if (inputArray.Length <> 0) then begin
      Delete(inputArray[i], 1, 6);
      Delete(inputArray[i], (inputArray[i].Length - 3), inputArray[i].Length);
      outputArray[i] := inputArray[i];
    end;
  end;
end;

procedure panelSearch;
var
  i: byte;
  panelOptions: array of string;
  panelRequest, correctString: string;
  //panelStringToSearch : array [0..5] of string;
begin
  panelButton1.Text := '';
  panelButton2.Text := '';
  panelButton3.Text := '';
  panelButton4.Text := '';
  panelButton5.Text := '';
  panelButton6.Text := '';
  panelButton1.Visible := False;
  panelButton2.Visible := False;
  panelButton3.Visible := False;
  panelButton4.Visible := False;
  panelButton5.Visible := False;
  panelButton6.Visible := False;
  panelRequest := mainTextBox.Text;
  panelRequest := panelRequest + '*' + '.txt';
  setlength(panelOptions, 1000);
  panelOptions := Directory.GetFiles('Notes', panelRequest);
  correctionString(panelOptions, panelOptions);
  
  if (panelOptions.Length <> 0) then begin
    
    if (panelOptions.Length = 1) then begin
      panelButton1.Text := panelOptions[0];
      panelButton1.Visible := True;
      panelStringToSearch[0] := panelButton1.Text + '.txt';
    end;
    
    if (panelOptions.Length = 2) then begin
      panelButton1.Text := panelOptions[0];
      panelButton2.Text := panelOptions[1];
      panelButton1.Visible := True;
      panelButton2.Visible := True;
      panelStringToSearch[0] := panelButton1.Text + '.txt';
      panelStringToSearch[1] := panelButton2.Text + '.txt';
    end;
    
    if (panelOptions.Length = 3) then begin
      panelButton1.Text := panelOptions[0];
      panelButton2.Text := panelOptions[1];
      panelButton3.Text := panelOptions[2];
      panelButton1.Visible := True;
      panelButton2.Visible := True;
      panelButton3.Visible := True;
      panelStringToSearch[0] := panelButton1.Text + '.txt';
      panelStringToSearch[1] := panelButton2.Text + '.txt';
      panelStringToSearch[2] := panelButton3.Text + '.txt';
    end;
    
    if (panelOptions.Length = 4) then begin
      panelButton1.Text := panelOptions[0];
      panelButton2.Text := panelOptions[1];
      panelButton3.Text := panelOptions[2];
      panelButton4.Text := panelOptions[3];
      panelButton1.Visible := True;
      panelButton2.Visible := True;
      panelButton3.Visible := True;
      panelButton4.Visible := True;
      panelStringToSearch[0] := panelButton1.Text + '.txt';
      panelStringToSearch[1] := panelButton2.Text + '.txt';
      panelStringToSearch[2] := panelButton3.Text + '.txt';
      panelStringToSearch[3] := panelButton4.Text + '.txt';
    end;
    
    if (panelOptions.Length = 5) then begin
      panelButton1.Text := panelOptions[0];
      panelButton2.Text := panelOptions[1];
      panelButton3.Text := panelOptions[2];
      panelButton4.Text := panelOptions[3];
      panelButton5.Text := panelOptions[4];
      panelButton1.Visible := True;
      panelButton2.Visible := True;
      panelButton3.Visible := True;
      panelButton4.Visible := True;
      panelButton5.Visible := True;
      panelStringToSearch[0] := panelButton1.Text + '.txt';
      panelStringToSearch[1] := panelButton2.Text + '.txt';
      panelStringToSearch[2] := panelButton3.Text + '.txt';
      panelStringToSearch[3] := panelButton4.Text + '.txt';
      panelStringToSearch[4] := panelButton5.Text + '.txt';
    end;
    
    if (panelOptions.Length >= 6) then begin
      panelButton1.Text := panelOptions[0];
      panelButton2.Text := panelOptions[1];
      panelButton3.Text := panelOptions[2];
      panelButton4.Text := panelOptions[3];
      panelButton5.Text := panelOptions[4];
      panelButton6.Text := panelOptions[5];
      panelButton1.Visible := True;
      panelButton2.Visible := True;
      panelButton3.Visible := True;
      panelButton4.Visible := True;
      panelButton5.Visible := True;
      panelButton6.Visible := True;
      panelStringToSearch[0] := panelButton1.Text + '.txt';
      panelStringToSearch[1] := panelButton2.Text + '.txt';
      panelStringToSearch[2] := panelButton3.Text + '.txt';
      panelStringToSearch[3] := panelButton4.Text + '.txt';
      panelStringToSearch[4] := panelButton5.Text + '.txt';
      panelStringToSearch[5] := panelButton6.Text + '.txt';
    end;
  end;
  
end;

procedure clickPanelButton1;
var
  z: integer;
  f: text;
  fileName, resStr, flowchartName, nameOfCodeEx: string;
  form2: form;
  resultLabel: &label;
  pic, picCode: PictureBox;
begin
  fileName := 'Notes\' + panelStringToSearch[0];
  assign(f, fileName);
  reset(f);
  readln(f, flowchartName);
  while not eof(f) do
  begin
    if (z = 1) then readln(f, nameOfCodeEx);
    if (z = 2) then readln(f, resStr);
    z := z + 1;
  end;
  
  form2 := new Form();
  form2.Width := 1130;
  form2.Height := 660;
  
  resultLabel := new &label();
  resultLabel.Width := 280;
  resultLabel.Height := 600;
  resultLabel.Left := 410;
  resultLabel.Top := 10;
  resultLabel.Text := resStr;
  resultLabel.Font := new Font('Tobota', 10);
  resultLabel.ForeColor := System.Drawing.Color.Black;
  resultLabel.BackColor := Color.FromArgb(255, 255, 255, 255);
  form2.Controls.Add(resultLabel);
  
  picCode := new PictureBox();
  picCode.Location := new Point(10, 10);
  picCode.Width := 390;
  picCode.Height := 600;
  picCode.BackColor := Color.FromArgb(255, 255, 255, 255);
  picCode.Image := Image.FromFile(nameOfCodeEx);
  picCode.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(picCode);
    //form2.ShowDialog();
    //resStr := nil;
    //fileName := nil;
  
  pic := new PictureBox();
  pic.Location := new Point(700, 10);
  pic.Width := 400;
  pic.Height := 600;
  pic.BackColor := Color.FromArgb(255, 255, 255, 255);
  pic.Image := Image.FromFile(flowchartName);
  pic.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(pic);
  form2.ShowDialog();
  resStr := nil;
  fileName := nil;
end;

procedure clickPanelButton2;
var
  z: integer; 
  f: text;
  fileName, resStr, flowchartName, nameOfCodeEx: string;
  form2: form;
  resultLabel: &label;
  pic, picCode: PictureBox;
begin
  fileName := 'Notes\' + panelStringToSearch[1];
  assign(f, fileName);
  reset(f);
  readln(f, flowchartName);
  while not eof(f) do
  begin
    if (z = 1) then readln(f, nameOfCodeEx);
    if (z = 2) then readln(f, resStr);
    z := z + 1;
  end;
  
  form2 := new Form();
  form2.Width := 1130;
  form2.Height := 660;
  
  resultLabel := new &label();
  resultLabel.Width := 280;
  resultLabel.Height := 600;
  resultLabel.Left := 410;
  resultLabel.Top := 10;
  resultLabel.Text := resStr;
  resultLabel.Font := new Font('Tobota', 10);
  resultLabel.ForeColor := System.Drawing.Color.Black;
  resultLabel.BackColor := Color.FromArgb(255, 255, 255, 255);
  form2.Controls.Add(resultLabel);
  
  picCode := new PictureBox();
  picCode.Location := new Point(10, 10);
  picCode.Width := 390;
  picCode.Height := 600;
  picCode.BackColor := Color.FromArgb(255, 255, 255, 255);
  picCode.Image := Image.FromFile(nameOfCodeEx);
  picCode.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(picCode);
    //form2.ShowDialog();
    //resStr := nil;
    //fileName := nil;
  
  pic := new PictureBox();
  pic.Location := new Point(700, 10);
  pic.Width := 400;
  pic.Height := 600;
  pic.BackColor := Color.FromArgb(255, 255, 255, 255);
  pic.Image := Image.FromFile(flowchartName);
  pic.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(pic);
  form2.ShowDialog();
  resStr := nil;
  fileName := nil;
end;

procedure clickPanelButton3;
var
  z: integer; 
  f: text;
  fileName, resStr, flowchartName, nameOfCodeEx: string;
  form2: form;
  resultLabel: &label;
  pic, picCode: PictureBox;
begin
  fileName := 'Notes\' + panelStringToSearch[2];
  assign(f, fileName);
  reset(f);
  readln(f, flowchartName);
  while not eof(f) do
  begin
    if (z = 1) then readln(f, nameOfCodeEx);
    if (z = 2) then readln(f, resStr);
    z := z + 1;
  end;
  
  form2 := new Form();
  form2.Width := 1130;
  form2.Height := 660;
  
  resultLabel := new &label();
  resultLabel.Width := 280;
  resultLabel.Height := 600;
  resultLabel.Left := 410;
  resultLabel.Top := 10;
  resultLabel.Text := resStr;
  resultLabel.Font := new Font('Tobota', 10);
  resultLabel.ForeColor := System.Drawing.Color.Black;
  resultLabel.BackColor := Color.FromArgb(255, 255, 255, 255);
  form2.Controls.Add(resultLabel);
  
  picCode := new PictureBox();
  picCode.Location := new Point(10, 10);
  picCode.Width := 390;
  picCode.Height := 600;
  picCode.BackColor := Color.FromArgb(255, 255, 255, 255);
  picCode.Image := Image.FromFile(nameOfCodeEx);
  picCode.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(picCode);
    //form2.ShowDialog();
    //resStr := nil;
    //fileName := nil;
  
  pic := new PictureBox();
  pic.Location := new Point(700, 10);
  pic.Width := 400;
  pic.Height := 600;
  pic.BackColor := Color.FromArgb(255, 255, 255, 255);
  pic.Image := Image.FromFile(flowchartName);
  pic.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(pic);
  form2.ShowDialog();
  resStr := nil;
  fileName := nil;
end;

procedure clickPanelButton4;
var
  z: integer;
  f: text;
  fileName, resStr, flowchartName, nameOfCodeEx: string;
  form2: form;
  resultLabel: &label;
  pic, picCode: PictureBox;
begin
  fileName := 'Notes\' + panelStringToSearch[3];
  assign(f, fileName);
  reset(f);
  readln(f, flowchartName);
  while not eof(f) do
  begin
    if (z = 1) then readln(f, nameOfCodeEx);
    if (z = 2) then readln(f, resStr);
    z := z + 1;
  end;
  
  form2 := new Form();
  form2.Width := 1130;
  form2.Height := 660;
  
  resultLabel := new &label();
  resultLabel.Width := 280;
  resultLabel.Height := 600;
  resultLabel.Left := 410;
  resultLabel.Top := 10;
  resultLabel.Text := resStr;
  resultLabel.Font := new Font('Tobota', 10);
  resultLabel.ForeColor := System.Drawing.Color.Black;
  resultLabel.BackColor := Color.FromArgb(255, 255, 255, 255);
  form2.Controls.Add(resultLabel);
  
  picCode := new PictureBox();
  picCode.Location := new Point(10, 10);
  picCode.Width := 390;
  picCode.Height := 600;
  picCode.BackColor := Color.FromArgb(255, 255, 255, 255);
  picCode.Image := Image.FromFile(nameOfCodeEx);
  picCode.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(picCode);
    //form2.ShowDialog();
    //resStr := nil;
    //fileName := nil;
  
  pic := new PictureBox();
  pic.Location := new Point(700, 10);
  pic.Width := 400;
  pic.Height := 600;
  pic.BackColor := Color.FromArgb(255, 255, 255, 255);
  pic.Image := Image.FromFile(flowchartName);
  pic.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(pic);
  form2.ShowDialog();
  resStr := nil;
  fileName := nil;
end;

procedure clickPanelButton5;
var
  z: integer;
  f: text;
  fileName, resStr, flowchartName, nameOfCodeEx: string;
  form2: form;
  resultLabel: &label;
  pic, picCode: PictureBox;
begin
  fileName := 'Notes\' + panelStringToSearch[4];
  assign(f, fileName);
  reset(f);
  readln(f, flowchartName);
  while not eof(f) do
  begin
    if (z = 1) then readln(f, nameOfCodeEx);
    if (z = 2) then readln(f, resStr);
    z := z + 1;
  end;
  
  form2 := new Form();
  form2.Width := 1130;
  form2.Height := 660;
  
  resultLabel := new &label();
  resultLabel.Width := 280;
  resultLabel.Height := 600;
  resultLabel.Left := 410;
  resultLabel.Top := 10;
  resultLabel.Text := resStr;
  resultLabel.Font := new Font('Tobota', 10);
  resultLabel.ForeColor := System.Drawing.Color.Black;
  resultLabel.BackColor := Color.FromArgb(255, 255, 255, 255);
  form2.Controls.Add(resultLabel);
  
  picCode := new PictureBox();
  picCode.Location := new Point(10, 10);
  picCode.Width := 390;
  picCode.Height := 600;
  picCode.BackColor := Color.FromArgb(255, 255, 255, 255);
  picCode.Image := Image.FromFile(nameOfCodeEx);
  picCode.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(picCode);
    //form2.ShowDialog();
    //resStr := nil;
    //fileName := nil;
  
  pic := new PictureBox();
  pic.Location := new Point(700, 10);
  pic.Width := 400;
  pic.Height := 600;
  pic.BackColor := Color.FromArgb(255, 255, 255, 255);
  pic.Image := Image.FromFile(flowchartName);
  pic.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(pic);
  form2.ShowDialog();
  resStr := nil;
  fileName := nil;
end;

procedure clickPanelButton6;
var
  z: integer;
  f: text;
  fileName, resStr, flowchartName, nameOfCodeEx: string;
  form2: form;
  resultLabel: &label;
  pic, picCode: PictureBox;
begin
  fileName := 'Notes\' + panelStringToSearch[5];
  assign(f, fileName);
  reset(f);
  readln(f, flowchartName);
  while not eof(f) do
  begin
    if (z = 1) then readln(f, nameOfCodeEx);
    if (z = 2) then readln(f, resStr);
    z := z + 1;
  end;
  
  form2 := new Form();
  form2.Width := 1130;
  form2.Height := 660;
  
  resultLabel := new &label();
  resultLabel.Width := 280;
  resultLabel.Height := 600;
  resultLabel.Left := 410;
  resultLabel.Top := 10;
  resultLabel.Text := resStr;
  resultLabel.Font := new Font('Tobota', 10);
  resultLabel.ForeColor := System.Drawing.Color.Black;
  resultLabel.BackColor := Color.FromArgb(255, 255, 255, 255);
  form2.Controls.Add(resultLabel);
  
  picCode := new PictureBox();
  picCode.Location := new Point(10, 10);
  picCode.Width := 390;
  picCode.Height := 600;
  picCode.BackColor := Color.FromArgb(255, 255, 255, 255);
  picCode.Image := Image.FromFile(nameOfCodeEx);
  picCode.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(picCode);
    //form2.ShowDialog();
    //resStr := nil;
    //fileName := nil;
  
  pic := new PictureBox();
  pic.Location := new Point(700, 10);
  pic.Width := 400;
  pic.Height := 600;
  pic.BackColor := Color.FromArgb(255, 255, 255, 255);
  pic.Image := Image.FromFile(flowchartName);
  pic.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(pic);
  form2.ShowDialog();
  resStr := nil;
  fileName := nil;
end;

procedure clickShowMeAllInsidePanel;
var
  i: integer;
  f: text;
  fileName, resStr, flowchartName, nameOfCodeEx: string;
  form2: form;
  resultLabel: &label;
  z, r: byte;
  pic, picCode: PictureBox;
  arrOfButtonText: array of string;
begin
  setlength(arrOfButtonText,100);
  for i := 0 to allList.Length - 1 do
  begin
    if buttonArray[i].Focused = true then
      z := i;
  end;
  fileName := 'Notes/' + buttonArray[z].Text + '.txt';
  assign(f, fileName);
  reset(f);
   // readln(f, flowchartName);
    //readln(f, nameOfCodeEx);
   // z:=0;
  while not eof(f) do
  begin
    if (r = 1) then readln(f, flowchartName); 
    if (r = 2) then readln(f, nameOfCodeEx);
    if (r = 3) then readln(f, resStr);
    r := r + 1;
  end;
  r := 0;
    //readln(f, resStr);
    //end;
  
  form2 := new Form();
  form2.Width := 1130;
  form2.Height := 660;
  
  resultLabel := new &label();
  resultLabel.Width := 280;
  resultLabel.Height := 600;
  resultLabel.Left := 410;
  resultLabel.Top := 10;
  resultLabel.Text := resStr;
  resultLabel.Font := new Font('Tobota', 10);
  resultLabel.ForeColor := System.Drawing.Color.Black;
  resultLabel.BackColor := Color.FromArgb(255, 255, 255, 255);
  form2.Controls.Add(resultLabel);
  
  picCode := new PictureBox();
  picCode.Location := new Point(10, 10);
  picCode.Width := 390;
  picCode.Height := 600;
  picCode.BackColor := Color.FromArgb(255, 255, 255, 255);
  picCode.Image := Image.FromFile(nameOfCodeEx);
  picCode.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(picCode);
    //form2.ShowDialog();
    //resStr := nil;
    //fileName := nil;
  
  pic := new PictureBox();
  pic.Location := new Point(700, 10);
  pic.Width := 400;
  pic.Height := 600;
  pic.BackColor := Color.FromArgb(255, 255, 255, 255);
  pic.Image := Image.FromFile(flowchartName);
  pic.SizeMode :=  PictureBoxSizeMode.Zoom;
  form2.Controls.Add(pic);
  form2.ShowDialog();
  resStr := nil;
  fileName := nil;
end;

procedure clickShowMeAllButton;
var
  i: integer;  
  z: byte;
begin
  setlength(allList, 1000);
  allList := Directory.GetFiles('Notes');
  allListDir := copy(allList);
  correctionString(allList, allList);
  mainWin.Visible := False;
  
  for i := 0 to allList.Length - 1 do
  begin
    z := i;
    position := z * 25;
    buttonArray[z] := new Button(); 
    buttonArray[z].Location := new Point(0, position);
    buttonArray[z].Size := new Size(350, 25);
    buttonArray[z].BackColor := Color.FromArgb(255, 255, 255, 255);
    //panelButton1.Text := 'Test';
    buttonArray[z].FlatAppearance.BorderSize := 0;
    buttonArray[z].FlatStyle := FlatStyle.Flat;
    sort(allList);
    buttonArray[z].Text := (allList[z]);
    buttonArray[z].Click += clickShowMeAllInsidePanel;
    showMeAllPanel.Controls.Add(buttonArray[z]);
    
    deleteButton[z] := new Button();
    deleteButton[z].Location := new Point(322, 1);
    deleteButton[z].BackgroundImage := Image.FromFile('delete.bmp');
    deleteButton[z].FlatAppearance.BorderSize := 0;
    deleteButton[z].FlatStyle := FlatStyle.Flat;
    deleteButton[z].Click += clickDeleteShowMeAllInsidePanel;
    buttonArray[z].Controls.Add(deleteButton[z]);
  end;
  showMeAllWin.ShowDialog();
end;

procedure clickDeleteShowMeAllInsidePanel;

var
  i: integer;
  f: text;
  fileName, resStr: string;
  z: byte;
begin
  for i := 0 to allList.Length - 1 do
  begin
    if deleteButton[i].Focused = true then
    begin
      deleteButton[i].Visible := False;
      buttonArray[i].Text := 'DELETED';
      fileName := allListDir[i];
      assign(f, fileName);
      erase(f);
      z := i;
    end;
  end;
end;

procedure clickBackShowMeAllButton;
begin
  showMeAllWin.Visible := false;
  mainWin.Visible := true;
end;

begin
  
  timer1 := new Timer;
  Timer1.Tick += panelSearch;
  Timer1.Interval := 1000;
  Timer1.Start();
  
  panelButton1.Click += clickPanelButton1;
  panelButton2.Click += clickPanelButton2;
  panelButton3.Click += clickPanelButton3;
  panelButton4.Click += clickPanelButton4;
  panelButton5.Click += clickPanelButton5;
  panelButton6.Click += clickPanelButton6;
end.
