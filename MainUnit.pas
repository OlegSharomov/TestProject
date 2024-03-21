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
    СalculateCountOfLettersButton: TButton;
    procedure ChoiceButtonClick(Sender: TObject);
    procedure СalculateCountOfLettersButtonClick(Sender: TObject);
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
  // Если обратиться к строке из Memo, индекса которой не существует - вернется пустая строка ''.
  OutputEdit.Text := BigInputMemo.Lines[LineChoiceComboBox.ItemIndex]
  else
    ShowMessage('Параметр не выбран');
  end;


procedure TMainForm.FormResize(Sender: TObject);
begin
  BigInputMemo.Width := ClientWidth;
end;

procedure TMainForm.СalculateCountOfLettersButtonClick(Sender: TObject);
var
  Regex: TRegEx;
  Match: TMatch;
  Result: Integer;
begin
  // Создаем регулярное выражение, которое ищет букву 'Б' без учета регистра
  Regex := TRegEx.Create('[бБ]');
  // Находим совпадения в строке
  Match := Regex.Match(BigInputMemo.Lines.Text);
  Result := 0;
  // Итерируем по совпадениям и подсчитываем их количество
  while Match.Success do
  begin
    Inc(Result);
    Match := Match.NextMatch;
  end;
  OutputEdit.Text := IntToStr(Result);
end;

end.
