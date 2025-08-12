unit uPesquisaCatProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisaCatProduto = class(TForm)
    pnBottomPesquisa: TPanel;
    btConfirmar: TButton;
    btFechar: TButton;
    pnTopPesquisa: TPanel;
    lbPesquisa: TLabel;
    cbPesquisa: TComboBox;
    edPesquisa: TEdit;
    btConsulta: TButton;
    dbPesquisaCatProduto: TDBGrid;
    qryPesquisaCatProduto: TFDQuery;
    dstPesquisaCatProduto: TDataSource;
    qryPesquisaCatProdutocodigo: TIntegerField;
    qryPesquisaCatProdutonome: TWideStringField;
    procedure btFecharClick(Sender: TObject);
    procedure btConsultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbPesquisaClienteDblClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure dbPesquisaCatProdutoDblClick(Sender: TObject);
  private
    { Private declarations }
    FCodigoSelecionado: Integer;
  public
    { Public declarations }
    function SelecionarCliente: Integer;
  end;

var
  frmPesquisaCatProduto: TfrmPesquisaCatProduto;

implementation

{$R *.dfm}

procedure TfrmPesquisaCatProduto.btFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPesquisaCatProduto.dbPesquisaCatProdutoDblClick(Sender: TObject);
begin
  if not qryPesquisaCatProduto.IsEmpty then
  begin
    FCodigoSelecionado := qryPesquisaCatProdutocodigo.AsInteger;
    ModalResult := mrOk; // Fecha o form
  end;
end;

procedure TfrmPesquisaCatProduto.dbPesquisaClienteDblClick(Sender: TObject);
begin
  if not qryPesquisaCatProduto.IsEmpty then
  begin
    FCodigoSelecionado := qryPesquisaCatProdutocodigo.AsInteger;
    ModalResult := mrOk; // Fecha o form
  end;
end;

procedure TfrmPesquisaCatProduto.btConfirmarClick(Sender: TObject);
begin
  if not qryPesquisaCatProduto.IsEmpty then
  begin
    FCodigoSelecionado := qryPesquisaCatProdutocodigo.AsInteger;
    ModalResult := mrOk; // Fecha o form
end;
end;

procedure TfrmPesquisaCatProduto.btConsultaClick(Sender: TObject);
begin

  qryPesquisaCatProduto.Close;
  qryPesquisaCatProduto.SQL.Clear;
  qryPesquisaCatProduto.SQL.Add('SELECT * FROM cat_produto ');
  qryPesquisaCatProduto.SQL.Add('WHERE 1=1');

  if edPesquisa.Text <> '' then
  begin

    with qryPesquisaCatProduto do
      begin
        if cbPesquisa.text = 'codigo' then
        begin
          qryPesquisaCatProduto.SQL.Add('AND codigo = :codigo');
          qryPesquisaCatProduto.ParamByName('codigo').AsInteger := StrToIntDef(edPesquisa.Text, 0);
        end;

        if cbPesquisa.text = 'nome' then
        begin
          qryPesquisaCatProduto.SQL.Add('AND nome ILIKE :nome');
           qryPesquisaCatProduto.ParamByName('nome').AsString := '%' + edPesquisa.Text + '%';
        end;

      end;

  end;

  qryPesquisaCatProduto.Open;

end;

procedure TfrmPesquisaCatProduto.FormShow(Sender: TObject);
var
  i : integer;
begin
  qryPesquisaCatProduto.Close;
  qryPesquisaCatProduto.SQL.Clear;
  qryPesquisaCatProduto.SQL.Add('SELECT * FROM cat_produto');
  qryPesquisaCatProduto.Open;

  cbPesquisa.Items.Clear;

  for i:=0 to qryPesquisaCatProduto.FieldCount -1 do
  begin
    cbPesquisa.Items.Add(qryPesquisaCatProduto.Fields[i].FieldName);
  end;

  if cbPesquisa.Items.Count > 0 then
    cbPesquisa.ItemIndex := 0;

end;

function TfrmPesquisaCatProduto.SelecionarCliente: Integer;
begin

  FCodigoSelecionado := 0; // valor padrão

  ShowModal;
  Result := FCodigoSelecionado;
end;

end.
