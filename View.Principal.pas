unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, MDBGrid, Vcl.Menus, Vcl.ComCtrls, ZAbstractConnection,
  ZConnection, Vcl.StdCtrls, Classe.Funcoes, System.IniFiles, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZSqlProcessor, Vcl.DBCtrls;

type
  TViewPrincipal = class(TForm)
    pnlPesquisaScripts: TPanel;
    pnlExecScript: TPanel;
    cdsScriptExecutar: TClientDataSet;
    cdsScriptExecutarNomeArquivo: TStringField;
    cdsScriptExecutarCaminhoCompleto: TStringField;
    dsrScriptExecutar: TDataSource;
    pmPrincipal: TPopupMenu;
    mniMarcarTodos: TMenuItem;
    mniDesmarcarTodos: TMenuItem;
    dlgPrincipal: TOpenDialog;
    pgcPrincipal: TPageControl;
    tsPrincipal: TTabSheet;
    conPrincipal: TZConnection;
    conSecundaria: TZConnection;
    edtCaminhoScript: TLabeledEdit;
    btnBuscar: TButton;
    tsConexaoLocal: TTabSheet;
    edtHostCL: TLabeledEdit;
    edtUsuarioCL: TLabeledEdit;
    edtSenhaCL: TLabeledEdit;
    btnConectarCL: TBitBtn;
    grdPrincipal: TDBGrid;
    cdsScriptExecutarSelecao: TStringField;
    btnExecScript: TBitBtn;
    cbbProtocoloCL: TComboBox;
    lbl2: TLabel;
    zpPrincipal: TZSQLProcessor;
    pnlConectado: TPanel;
    lbl3: TLabel;
    cbbDatabaseCL: TComboBox;
    qryPrincipal: TZQuery;
    cdsScriptExecutarSequencia: TIntegerField;
    dbnvgrPrincipal: TDBNavigator;
    mmoPrincipal: TMemo;
    btnDesconectar: TBitBtn;
    il1: TImageList;
    procedure mniMarcarTodosClick(Sender: TObject);
    procedure mniDesmarcarTodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtCaminhoScriptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCaminhoScriptChange(Sender: TObject);
    procedure grdPrincipalDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdPrincipalCellClick(Column: TColumn);
    procedure btnExecScriptClick(Sender: TObject);
    procedure cdsScriptExecutarSelecaoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnConectarCLClick(Sender: TObject);
    procedure conPrincipalAfterConnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdPrincipalTitleClick(Column: TColumn);
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure conPrincipalAfterDisconnect(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
  private
    FConectado: Boolean;
    FValorSequencia: Integer;
    procedure CarregaScripts;
    function GetConectado: Boolean;
    procedure SetConectado(const Value: Boolean);
    procedure GravarConexao;
    function returnProtocoloConexao(FNomeConexao: string): string;
    procedure CarregarConexao;
    procedure ConexaoBancoDisplay;
    { Private declarations }
  public
    { Public declarations }
    property Conectado: Boolean  read GetConectado write SetConectado;
    property ValorSequencia: integer read FValorSequencia write FValorSequencia;
  end;

var
  ViewPrincipal: TViewPrincipal;
  F: TFuncoes;

implementation

{$R *.dfm}

procedure TViewPrincipal.btnBuscarClick(Sender: TObject);
begin
  mmoPrincipal.Lines.Clear;
  if dlgPrincipal.Execute then
    edtCaminhoScript.Text :=  ExtractFilePath(dlgPrincipal.FileName);
end;

procedure TViewPrincipal.edtCaminhoScriptChange(Sender: TObject);
begin
  mmoPrincipal.Lines.Clear;
  if edtCaminhoScript.Text <> EmptyStr then
    if DirectoryExists(edtCaminhoScript.Text) then
      CarregaScripts
    else
      edtCaminhoScript.Text := '';

end;

procedure TViewPrincipal.edtCaminhoScriptKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If (Shift = [ssCtrl]) and (key = 86) then
  begin
    edtCaminhoScript.Text := ExtractFilePath(F.ObterPathClipBoard);
  end;
end;

procedure TViewPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  conPrincipal.Disconnect;
  conSecundaria.Disconnect;
  cbbDatabaseCL.Items.SaveToFile(ExtractFilePath(Application.ExeName) + '\ConfiguracaoComboboxExecScript.ini');
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  FConectado := False;
  F := TFuncoes.Create;
  pgcPrincipal.ActivePage := tsPrincipal;
  CarregarConexao;
  ConexaoBancoDisplay;
  if FileExists(ExtractFilePath(Application.ExeName) + '\ConfiguracaoComboboxExecScript.ini') then
    cbbDatabaseCL.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + '\ConfiguracaoComboboxExecScript.ini');
end;

procedure TViewPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(F);
end;

function TViewPrincipal.GetConectado: Boolean;
begin
  Result := FConectado;
end;

procedure TViewPrincipal.grdPrincipalCellClick(Column: TColumn);
begin
  cdsScriptExecutar.Open;
  if UpperCase(Column.FieldName) = 'SELECAO' then
  begin
    cdsScriptExecutar.Edit;
    cdsScriptExecutarSelecao.AsString := F.iif(cdsScriptExecutarSelecao.AsString = 'S', 'N', 'S');
    cdsScriptExecutar.Post;
  end;

  if UpperCase(Column.FieldName) = 'SEQUENCIA' then
  begin
    if cdsScriptExecutarSequencia.IsNull then
    begin
      cdsScriptExecutar.Edit;
      cdsScriptExecutarSequencia.AsInteger := FValorSequencia + 1;
      cdsScriptExecutar.Post;
      FValorSequencia := FValorSequencia + 1;
    end
    else
    begin
      cdsScriptExecutar.Edit;
      cdsScriptExecutarSequencia.AsVariant := null;
      cdsScriptExecutar.Post;
      FValorSequencia := FValorSequencia - 1;
    end;

    if cdsScriptExecutar.RecordCount = FValorSequencia then
      grdPrincipalTitleClick(Column);
  end;
end;

procedure TViewPrincipal.grdPrincipalDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  cdsScriptExecutar.Open;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  // Desenha um checkbox no dbgrid
  if UpperCase(Column.FieldName) = 'SELECAO' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);

    if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('SELECAO').AsString = 'S') then
      Check := DFCS_CHECKED
    else
      Check := 0;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TViewPrincipal.grdPrincipalTitleClick(Column: TColumn);
begin
  cdsScriptExecutar.IndexFieldNames := Column.FieldName;
end;

procedure TViewPrincipal.mniDesmarcarTodosClick(Sender: TObject);
begin
  cdsScriptExecutar.DisableControls;
  cdsScriptExecutar.First;
  while not(cdsScriptExecutar.Eof) do
  begin
    cdsScriptExecutar.Edit;
    cdsScriptExecutarSelecao.AsString := 'N';
    cdsScriptExecutar.Post;
    cdsScriptExecutar.Next;
  end;
  cdsScriptExecutar.First;
  cdsScriptExecutar.EnableControls;
end;

procedure TViewPrincipal.mniMarcarTodosClick(Sender: TObject);
begin
  cdsScriptExecutar.DisableControls;
  cdsScriptExecutar.First;
  while not(cdsScriptExecutar.Eof) do
  begin
    cdsScriptExecutar.Edit;
    cdsScriptExecutarSelecao.AsString := 'S';
    cdsScriptExecutar.Post;
    cdsScriptExecutar.Next;
  end;
  cdsScriptExecutar.EnableControls;
  cdsScriptExecutar.First;
end;

procedure TViewPrincipal.SetConectado(const Value: Boolean);
begin
  FConectado := Value;
end;

procedure TViewPrincipal.tmrPrincipalTimer(Sender: TObject);
begin
  if FConectado then
  begin
    if not conPrincipal.PingServer then
    begin
      conPrincipal.Connected := False;
      conPrincipal.Connect;
    end;
  end;
end;

procedure TViewPrincipal.btnConectarCLClick(Sender: TObject);
begin
  try
    try
      cdsScriptExecutar.EmptyDataSet;
      edtCaminhoScript.Clear;
      conPrincipal.Connected := False;
      conPrincipal.Protocol := returnProtocoloConexao(cbbProtocoloCL.Text);
      conPrincipal.HostName := edtHostCL.Text;
      conPrincipal.Database := cbbDatabaseCL.Text;
      conPrincipal.User := edtUsuarioCL.Text;
      conPrincipal.Password := edtSenhaCL.Text;

      conPrincipal.Connect;
      GravarConexao;

      Application.MessageBox('Conectado com Sucesso!', 'Atenção', MB_OK +
        MB_ICONINFORMATION);

      pgcPrincipal.ActivePage := tsPrincipal;

    except on E: Exception do
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_OK + MB_ICONWARNING);
    end;
  finally
    FConectado := conPrincipal.Connected;
  end;
end;

procedure TViewPrincipal.btnDesconectarClick(Sender: TObject);
begin
  conPrincipal.Disconnect;
  cdsScriptExecutar.EmptyDataSet;
  pgcPrincipal.ActivePage := tsPrincipal;
end;

procedure TViewPrincipal.btnExecScriptClick(Sender: TObject);
var
  vlsScript: string;
begin
  if FConectado then
  begin
    if cdsScriptExecutar.RecordCount > 0 then
    begin
      cdsScriptExecutar.Filtered := False;
      cdsScriptExecutar.Filter := 'Selecao = ''S''';
      cdsScriptExecutar.Filtered := True;

      if cdsScriptExecutar.RecordCount > 0 then
      begin
        try
          try
            mmoPrincipal.Lines.Clear;
            F.AguardeOn('Processando os scripts...',Self);
            zpPrincipal.Connection := conPrincipal;

            cdsScriptExecutar.First;
            while not cdsScriptExecutar.Eof do
            begin
              vlsScript := cdsScriptExecutarNomeArquivo.AsString;

              F.AguardeOn('Executando: ' + vlsScript,Self);
              zpPrincipal.Script.Clear;
              zpPrincipal.Script.LoadFromFile(cdsScriptExecutarCaminhoCompleto.AsString);
              zpPrincipal.Execute;

              mmoPrincipal.Lines.Add('Executado com sucesso: ' + vlsScript);

              cdsScriptExecutar.Next;
            end;

            F.AguardeOff;
            Application.MessageBox('Executado os Scripts com Sucesso.', 'Atenção', MB_OK + MB_ICONINFORMATION);

          except on E: Exception do
            begin
              F.AguardeOff;
              mmoPrincipal.Lines.Add('Erro ao executar o script: ' + vlsScript);
              mmoPrincipal.Lines.Add('Erro: ' + E.Message);
              Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_OK + MB_ICONWARNING);
            end;
          end;
        finally
          cdsScriptExecutar.Filtered := False;
          mniDesmarcarTodosClick(Sender);
        end;
      end
      else
        Application.MessageBox('Selecione os scripts a executar.', 'Atenção',
          MB_OK + MB_ICONWARNING);
    end
    else
      Application.MessageBox('Selecione os scripts a executar.', 'Atenção',
        MB_OK + MB_ICONWARNING);
  end
  else
    Application.MessageBox('É Preciso Conectar no Banco de Dados que deseja executar o script.',
      'Atenção', MB_OK + MB_ICONWARNING);

end;

procedure TViewPrincipal.CarregaScripts;
var
  i: Integer;
  Search: TSearchRec;
begin
  FValorSequencia := 0;
  cdsScriptExecutar.Open;
  cdsScriptExecutar.EmptyDataSet;
  i := FindFirst(edtCaminhoScript.Text + '*.sql', faAnyFile, Search);
  while i = 0 do
  begin
    cdsScriptExecutar.Append;
    cdsScriptExecutarNomeArquivo.AsString := Search.Name;
    cdsScriptExecutarCaminhoCompleto.AsString := edtCaminhoScript.Text + Search.Name;
    cdsScriptExecutar.Post;
    i := FindNext(Search);
  end;
  cdsScriptExecutar.Open;
end;

procedure TViewPrincipal.cdsScriptExecutarSelecaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := EmptyStr;
end;

procedure TViewPrincipal.conPrincipalAfterConnect(Sender: TObject);
var
  vlsBanco: string;
begin
  try
    try
      ConexaoBancoDisplay;
      vlsBanco := cbbDatabaseCL.Text;
      conSecundaria.Connected := False;
      conSecundaria.Protocol := returnProtocoloConexao(cbbProtocoloCL.Text);
      conSecundaria.HostName := edtHostCL.Text;
      conSecundaria.Database := 'master';
      conSecundaria.User := edtUsuarioCL.Text;
      conSecundaria.Password := edtSenhaCL.Text;

      conSecundaria.Connect;

      qryPrincipal.Connection := conSecundaria;
      qryPrincipal.SQL.Clear;
      qryPrincipal.SQL.Add('SELECT name FROM sys.databases ');
      qryPrincipal.SQL.Add('where name not in(''master'', ''tempdb'', ''model'', ''msdb'') ');
      qryPrincipal.SQL.Add('order by name');
      qryPrincipal.Open;

      if qryPrincipal.RecordCount > 0 then
      begin
        cbbDatabaseCL.Items.Clear;
        qryPrincipal.First;
        while not qryPrincipal.Eof do
        begin
          cbbDatabaseCL.Items.Add(qryPrincipal.FieldByName('name').AsString);
          qryPrincipal.Next;
        end;

        cbbDatabaseCL.ItemIndex := cbbDatabaseCL.Items.IndexOf(vlsBanco);
      end;
    except on E: Exception do
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_OK + MB_ICONWARNING);
    end;
  finally
    conSecundaria.Disconnect;
  end;
end;

procedure TViewPrincipal.conPrincipalAfterDisconnect(Sender: TObject);
begin
  conSecundaria.Disconnect;
  ConexaoBancoDisplay;
end;

procedure TViewPrincipal.GravarConexao;
var
  vlsCaminhoIni: string;
  vloInifile: TIniFile;
begin
  vloInifile := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\ConfiguracaoExecScript.ini');
  vloInifile.WriteString('ConexaoLocal', 'Protocolo', cbbProtocoloCL.Text);
  vloInifile.WriteString('ConexaoLocal', 'Hostname', edtHostCL.Text);
  vloInifile.WriteString('ConexaoLocal', 'Database', cbbDatabaseCL.Text);
  vloInifile.WriteString('ConexaoLocal', 'Usuario', edtUsuarioCL.Text);
  vloInifile.WriteString('ConexaoLocal', 'Senha', edtSenhaCL.Text);

  vloInifile.Free;
end;

procedure TViewPrincipal.CarregarConexao;
var
  vlsCaminhoIni: string;
  vloInifile: TIniFile;
begin
  vloInifile := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\ConfiguracaoExecScript.ini');
  cbbProtocoloCL.Text :=  vloInifile.ReadString('ConexaoLocal', 'Protocolo', '');
  edtHostCL.Text := vloInifile.ReadString('ConexaoLocal', 'Hostname', '');
  cbbDatabaseCL.Text := vloInifile.ReadString('ConexaoLocal', 'Database', '');
  edtUsuarioCL.Text := vloInifile.ReadString('ConexaoLocal', 'Usuario', '');
  edtSenhaCL.Text := vloInifile.ReadString('ConexaoLocal', 'Senha', '');

  vloInifile.Free;
end;

function TViewPrincipal.returnProtocoloConexao(FNomeConexao: string): string;
begin
  if FNomeConexao = 'SQL Server' then
    Result := 'mssql'
  else
  if FNomeConexao = 'PostgreSQL' then
    Result := 'postgresql-9'
  else
  if FNomeConexao = 'Firebird' then
    Result := 'firebird-2.5'
  else
  if FNomeConexao = 'MySQL' then
    Result := 'mysql'
  else
    Abort;
end;

procedure TViewPrincipal.ConexaoBancoDisplay;
begin
  if conPrincipal.Connected then
  begin
    pnlConectado.Font.Color := clGreen;
    pnlConectado.Font.Size := 15;
    pnlConectado.Font.Name := 'Segoe UI Light';
    pnlConectado.Caption := 'Conectado em Servidor: ' + edtHostCL.Text + ', Banco de Dados: ' + cbbDatabaseCL.Text;
  end
  else
  begin
    pnlConectado.Font.Color := clRed;
    pnlConectado.Font.Size := 15;
    pnlConectado.Font.Name := 'Segoe UI Light';
    pnlConectado.Caption := 'Desconectado em Servidor';
  end;
end;

end.
