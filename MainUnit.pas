unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RegularExpressions;

type
  TMainForm = class(TForm)
    BigInputMemo: TMemo;
    OutputEdit: TEdit;
    LineChoiceComboBox: TComboBox;
    ChoiceButton: TButton;
    �alculateCountOfLettersButton: TButton;
    procedure ChoiceButtonClick(Sender: TObject);
    procedure �alculateCountOfLettersButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ChoiceButtonClick(Sender: TObject);
var
I: Integer;
begin
  if LineChoiceComboBox.ItemIndex <> -1 then
  // ���� ���������� � ������ �� Memo, ������� ������� �� ���������� - �������� ������ ������ ''.
  OutputEdit.Text := BigInputMemo.Lines[LineChoiceComboBox.ItemIndex]
  else
    ShowMessage('�������� �� ������');
  end;


procedure TMainForm.FormResize(Sender: TObject);
begin
  BigInputMemo.Width := ClientWidth;
end;

procedure TMainForm.�alculateCountOfLettersButtonClick(Sender: TObject);
var
  Regex: TRegEx;
  Match: TMatch;
  Result: Integer;
begin
  // ������� ���������� ���������, ������� ���� ����� '�' ��� ����� ��������
  Regex := TRegEx.Create('[��]');
  // ������� ���������� � ������
  Match := Regex.Match(BigInputMemo.Lines.Text);
  Result := 0;
  // ��������� �� ����������� � ������������ �� ����������
  while Match.Success do
  begin
    Inc(Result);
    Match := Match.NextMatch;
  end;
  OutputEdit.Text := IntToStr(Result);
end;

end.
