﻿namespace ProjectRCLWPF;

interface

uses
  RemObjects.Elements.RTL.Delphi, RemObjects.Elements.RTL.Delphi.VCL;

type
  TForm6 = public class(TForm)
    //Button1: TButton;
  private
  { Private declarations }
  public
  { Public declarations }
    Button1: TButton;
    button2: TButton;
    edit1: TEdit;
    label1: TLabel;
    radioButton1: TRadioButton;
    CheckBox1: TCheckBox;
    listBox1: TListBox;
    comboBox1: TComboBox;
    groupBox1: TGroupBox;
    Panel1: TPanel;

    panel2: TPanel;
    label2: TLabel;
    label3: TLabel;
    label4: TLabel;
    label5: TLabel;
    label6: TLabel;
    checkBox2: TCheckBox;
    checkBox3: TCheckBox;
    checkBox4: TCheckBox;
    edit2: TEdit;
    edit3: TEdit;

    listview1: TListView;
    treeView1: TTreeView;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var key: Char);
  end;

  var
    Form6: TForm6;

implementation

procedure TForm6.Button1Click(Sender: TObject);
begin
  //ShowMessage('WPF!!');
  //label1.Width := 200;
  //label1.Caption := 'All right!';
  //ShowMessage('Clicked!');
  //ShowMessage(edit1.Text);

  {listBox1.Items.Add(edit1.Text);
  comboBox1.Items.Add(edit1.Text);
  edit1.OnKeyPress := @Edit1KeyPress;}

  {var lColumn := listview1.Columns.Add;
  lColumn.Caption := 'Loncho!';

  lColumn := listview1.Columns.Add;
  lColumn.Caption := 'Loncho 2';

  lColumn := listview1.Columns.Add;
  lColumn.Caption := 'Loncho 3';
  //listview1.Items.b


  var lItem := listview1.Items.Add;
  lItem.Caption := 'Item 1!!';
  lItem.SubItems.Add('Roncho 2');
  lItem.SubItems.Add('Roncho 3');
  lItem.Caption := 'Item 11!!';}

  var lNode := treeView1.Items.Add(nil, 'New Node!');
  treeView1.Items.AddChild(lNode, 'New Child!');
  treeView1.Items.AddChildFirst(lNode, 'New First Child!');




end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  edit1.Text := 'Blah!';
end;

procedure TForm6.ComboBox1Select(Sender: TObject);
begin
  ShowMessage('Yes!');
end;

procedure TForm6.Edit1KeyPress(Sender: TObject; var key: Char);
begin
  ShowMessage(key);
end;

end.