object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'ExecScript -  by Marcelo Borges'
  ClientHeight = 568
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisaScripts: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 150
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 935
    object pgcPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 884
      Height = 150
      ActivePage = tsPrincipal
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 935
      object tsPrincipal: TTabSheet
        Caption = '  Principal  '
        ExplicitWidth = 927
        object edtCaminhoScript: TLabeledEdit
          Left = 32
          Top = 82
          Width = 745
          Height = 21
          EditLabel.Width = 95
          EditLabel.Height = 13
          EditLabel.Caption = 'Caminho dos scripts'
          TabOrder = 0
          OnChange = edtCaminhoScriptChange
          OnKeyDown = edtCaminhoScriptKeyDown
        end
        object btnBuscar: TButton
          Left = 776
          Top = 81
          Width = 21
          Height = 23
          Caption = '...'
          TabOrder = 1
          OnClick = btnBuscarClick
        end
        object btnExecScript: TBitBtn
          Left = 803
          Top = 74
          Width = 169
          Height = 37
          Caption = '  Executar Script  '
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1514125B5140000000FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0B0B0B23232430303039393953535365
            656554524CC9A461E5BB6D5A513F1C1C1C070707FF00FFFF00FFFF00FF0B0B0B
            F8F8F8F5F5F6F0F0F1F0F0F0EFEFEFC2B9ABC99E53D8AB59E2B565E3B766B2A7
            92BDBDBE010101FF00FFFF00FF0D0D0DFBFBFBF5F5F6F0F0F1F1F1F1CDCCC9BB
            8D3DCC9B44C29E5FD0A75CE3B35CE1B25DB1A796010101FF00FFFF00FF0B0B0B
            D8D8D9DCDCDDDDDDDEE0E0E1E1E1E1B1A287B59458C8C7C5B7AFA2D3A450E1AD
            4EDCAC53201E18FF00FFFF00FF0B0B0BF9F9F9F5F5F6F0F0F1F0F0F0EFEFEFEA
            EAEADADADBE5E5E6D8D8D9B1A692D5A143DEA742CA9A42161512FF00FF0D0D0D
            FBFBFBF5F5F6F0F0F1F1F1F1F2F2F2EFEFF0EDEDEDEAEAEADCDCDDCCCCCCAD9E
            82D19A37D59E375C4D34FF00FF0A0A0AD2D2D4D7D7D8D9D9DADCDCDDDEDEDEDC
            DDDDDADADBD7D7D8CDCECEC3C3C4B9BABB9F8B6851442C000000FF00FF0B0B0B
            F8F8F8F5F5F6F0F0F1F0F0F0EFEFEFECECECE9E9E9E5E5E6D8D8D9CCCCCDC7C7
            C8BFBFC0010101FF00FFFF00FF0D0D0DFBFBFBF5F5F6F0F0F1F1F1F1F2F2F2EF
            EFEFEDEDEDEAEAEADCDCDDCCCCCDC7C7C8C2C2C3010101FF00FFFF00FF0A0A0A
            D3D3D4D7D7D8D9D9DADCDDDDDEDEDFDCDDDEDADADBD7D7D8CECECFC3C4C5BBBB
            BDAFAFB2010101FF00FFFF00FF0B0B0BF8F8F8F5F5F6F0F0F1F0F0F0EFEFEFEC
            ECECE8E8E9E5E5E5D8D8D9CCCCCDC7C7C8BDBDBE010101FF00FFFF00FF0D0D0D
            FBFBFBF5F5F6F0F0F1F1F1F1F2F2F2EFEFEFECECEDEAEAEADCDCDDCCCCCDC7C7
            C8C2C2C3010101FF00FFFF00FF0B0B0BE4E4E5D7D8D8D0D0D1CECECFCDCDCECD
            CDCECCCCCECCCCCDCBCBCCC9C9CAC8C8CAC4C4C5010101FF00FFFF00FFFF00FF
            1515152E2E2E5E5E5F7A7A7A7D7D7D7E7E7E7E7E7E7E7E7E7979795C5C5C2D2D
            2D121212FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 2
          OnClick = btnExecScriptClick
        end
        object pnlConectado: TPanel
          Left = 0
          Top = 0
          Width = 876
          Height = 50
          Align = alTop
          Caption = 'pnlConectado'
          Color = 16776176
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Segoe UI Light'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          ExplicitWidth = 927
        end
      end
      object tsConexaoLocal: TTabSheet
        Caption = '  Conex'#227'o Local  '
        ImageIndex = 2
        ExplicitWidth = 927
        object lbl2: TLabel
          Left = 32
          Top = 0
          Width = 91
          Height = 13
          Caption = 'Protocolo Conex'#227'o'
        end
        object lbl3: TLabel
          Left = 416
          Top = 0
          Width = 77
          Height = 13
          Caption = 'Banco de Dados'
        end
        object edtHostCL: TLabeledEdit
          Left = 32
          Top = 64
          Width = 169
          Height = 21
          EditLabel.Width = 68
          EditLabel.Height = 13
          EditLabel.Caption = 'Host Conex'#227'o'
          TabOrder = 0
        end
        object edtUsuarioCL: TLabeledEdit
          Left = 216
          Top = 16
          Width = 169
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = 'Usu'#225'rio Database'
          TabOrder = 1
        end
        object edtSenhaCL: TLabeledEdit
          Left = 216
          Top = 64
          Width = 169
          Height = 21
          EditLabel.Width = 79
          EditLabel.Height = 13
          EditLabel.Caption = 'Senha Database'
          PasswordChar = '#'
          TabOrder = 2
        end
        object btnConectarCL: TBitBtn
          Left = 416
          Top = 48
          Width = 100
          Height = 37
          Caption = '  Conectar  '
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1514125B5140000000FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0B0B0B23232430303039393953535365
            656554524CC9A461E5BB6D5A513F1C1C1C070707FF00FFFF00FFFF00FF0B0B0B
            F8F8F8F5F5F6F0F0F1F0F0F0EFEFEFC2B9ABC99E53D8AB59E2B565E3B766B2A7
            92BDBDBE010101FF00FFFF00FF0D0D0DFBFBFBF5F5F6F0F0F1F1F1F1CDCCC9BB
            8D3DCC9B44C29E5FD0A75CE3B35CE1B25DB1A796010101FF00FFFF00FF0B0B0B
            D8D8D9DCDCDDDDDDDEE0E0E1E1E1E1B1A287B59458C8C7C5B7AFA2D3A450E1AD
            4EDCAC53201E18FF00FFFF00FF0B0B0BF9F9F9F5F5F6F0F0F1F0F0F0EFEFEFEA
            EAEADADADBE5E5E6D8D8D9B1A692D5A143DEA742CA9A42161512FF00FF0D0D0D
            FBFBFBF5F5F6F0F0F1F1F1F1F2F2F2EFEFF0EDEDEDEAEAEADCDCDDCCCCCCAD9E
            82D19A37D59E375C4D34FF00FF0A0A0AD2D2D4D7D7D8D9D9DADCDCDDDEDEDEDC
            DDDDDADADBD7D7D8CDCECEC3C3C4B9BABB9F8B6851442C000000FF00FF0B0B0B
            F8F8F8F5F5F6F0F0F1F0F0F0EFEFEFECECECE9E9E9E5E5E6D8D8D9CCCCCDC7C7
            C8BFBFC0010101FF00FFFF00FF0D0D0DFBFBFBF5F5F6F0F0F1F1F1F1F2F2F2EF
            EFEFEDEDEDEAEAEADCDCDDCCCCCDC7C7C8C2C2C3010101FF00FFFF00FF0A0A0A
            D3D3D4D7D7D8D9D9DADCDDDDDEDEDFDCDDDEDADADBD7D7D8CECECFC3C4C5BBBB
            BDAFAFB2010101FF00FFFF00FF0B0B0BF8F8F8F5F5F6F0F0F1F0F0F0EFEFEFEC
            ECECE8E8E9E5E5E5D8D8D9CCCCCDC7C7C8BDBDBE010101FF00FFFF00FF0D0D0D
            FBFBFBF5F5F6F0F0F1F1F1F1F2F2F2EFEFEFECECEDEAEAEADCDCDDCCCCCDC7C7
            C8C2C2C3010101FF00FFFF00FF0B0B0BE4E4E5D7D8D8D0D0D1CECECFCDCDCECD
            CDCECCCCCECCCCCDCBCBCCC9C9CAC8C8CAC4C4C5010101FF00FFFF00FFFF00FF
            1515152E2E2E5E5E5F7A7A7A7D7D7D7E7E7E7E7E7E7E7E7E7979795C5C5C2D2D
            2D121212FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 3
          OnClick = btnConectarCLClick
        end
        object cbbProtocoloCL: TComboBox
          Left = 32
          Top = 16
          Width = 169
          Height = 21
          TabOrder = 4
          Text = 'SQL Server'
          Items.Strings = (
            'SQL Server'
            'PostgreSQL'
            'Firebird'
            'MySQL')
        end
        object cbbDatabaseCL: TComboBox
          Left = 416
          Top = 16
          Width = 204
          Height = 21
          TabOrder = 5
        end
        object btnDesconectar: TBitBtn
          Left = 520
          Top = 48
          Width = 100
          Height = 37
          Caption = '  Desconectar  '
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FF000000
            1717173131314545455151516060606666666666665E5E5E5151514646463232
            32171717000000000000FF00FFFF00FF090909181818FCFCFCE4E4E4C6C6C6B0
            B0B0A5A5A50B0B81BBBBBBCECECE1818180909090B0B81000000FF00FFFF00FF
            1C1C1CE7E7E7FCFCFCE4E4E4C6C6C6B0B0B00B0B810B0B810B0B83CECECEA5A5
            A50C0C840B0B810B0B81FF00FFFF00FFCECECEE7E7E7FCFCFCE4E4E4C6C6C6B0
            B0B0A5A5A50D0D880E0E8C0F0F8E0F0F8E0F0F8D0E0E8A000001FF00FFFF00FF
            CECECEB5B2AFB5B2AFB5B2AFB5B2AFB5B2AFB5B2AFB5B2AF1111951212981212
            98111196000002FF00FFFF00FFFF00FFC1BEBCC1BEBCC3C0BDE4E4E4C6C6C6B0
            B0B0A5A5A5ABABAB13139D1313A11414A213139F000000000000FF00FFFF00FF
            000000E7E7E7FCFCFCE4E4E4C6C6C6B0B0B0A5A5A513139E1515A51616AA1616
            AB1515A71313A1000000FF00FFFF00FFCECECEE7E7E7FCFCFCE4E4E4C6C6C6B0
            B0B01212991414A21616ABCBCBCEA5A5A51717AE1515A613139DFF00FFFF00FF
            CECECEE7E7E7B3B0ADB3B0ADB3B0ADB3B0ADB3B0AD1414A4B0ADADB3B0ADA5A5
            A50000001515A8000000FF00FFFF00FFC2C0BEBCB9B7BCB9B7C8C6C4C6C6C6B0
            B0B0A5A5A5ABABABBCB9B7BCB9B7BCB9B7000000FF00FFFF00FFFF00FFFF00FF
            000000E7E7E7FCFCFCE4E4E4C6C6C6B0B0B0A5A5A5ABABABBBBBBBCECECEA5A5
            A5000000FF00FFFF00FFFF00FFFF00FFCECECEE7E7E7FCFCFCE4E4E4C6C6C6B0
            B0B0A5A5A5ABABABBBBBBBCECECEA5A5A5000000FF00FFFF00FFFF00FFFF00FF
            CECECEE7E7E7B3B0ADB3B0ADB3B0ADB3B0ADB3B0ADB3B0ADB3B0ADB5B3B0A5A5
            A5000000FF00FFFF00FFFF00FFFF00FFCDCDCDC2BFBDC2BFBDC2BFBDC2BFBDC2
            BFBDC2BFBDC2BFBDC2BFBDC2BFBDC2BFBD000000FF00FFFF00FFFF00FFFF00FF
            FF00FFD2D0CDD2D0CDD2D0CDD2D0CDD2D0CDD2D0CDD2D0CDD2D0CDD2D0CDE3E2
            E1000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFEFEFEEF2F2F2ED
            EDECEEEEEDF2F2F2EBEAE9000000FF00FFFF00FFFF00FFFF00FF}
          TabOrder = 6
          OnClick = btnDesconectarClick
        end
      end
    end
  end
  object pnlExecScript: TPanel
    Left = 0
    Top = 150
    Width = 884
    Height = 418
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 3
    BorderWidth = 3
    Caption = 'pnlExecScript'
    TabOrder = 1
    ExplicitWidth = 935
    object grdPrincipal: TDBGrid
      Left = 3
      Top = 3
      Width = 878
      Height = 292
      Align = alClient
      DataSource = dsrScriptExecutar
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      PopupMenu = pmPrincipal
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grdPrincipalCellClick
      OnDrawColumnCell = grdPrincipalDrawColumnCell
      OnTitleClick = grdPrincipalTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Selecao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sequencia'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Sequ'#234'ncia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeArquivo'
          ReadOnly = True
          Width = 295
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CaminhoCompleto'
          ReadOnly = True
          Width = 950
          Visible = True
        end>
    end
    object dbnvgrPrincipal: TDBNavigator
      Left = 3
      Top = 384
      Width = 878
      Height = 31
      DataSource = dsrScriptExecutar
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alBottom
      TabOrder = 1
    end
    object mmoPrincipal: TMemo
      Left = 3
      Top = 295
      Width = 878
      Height = 89
      Align = alBottom
      Lines.Strings = (
        '')
      TabOrder = 2
      ExplicitLeft = 192
      ExplicitTop = 320
      ExplicitWidth = 185
    end
  end
  object cdsScriptExecutar: TClientDataSet
    PersistDataPacket.Data = {
      8C0000009619E0BD0100000018000000040000000000030000008C000753656C
      6563616F01004900000001000557494454480200020001000953657175656E63
      696104000100000000000B4E6F6D654172717569766F01004900000001000557
      4944544802000200C8000F43616D696E686F436F6D706C65746F020049000000
      010005574944544802000200401F0000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 824
    Top = 168
    object cdsScriptExecutarSelecao: TStringField
      FieldName = 'Selecao'
      OnGetText = cdsScriptExecutarSelecaoGetText
      Size = 1
    end
    object cdsScriptExecutarSequencia: TIntegerField
      FieldName = 'Sequencia'
    end
    object cdsScriptExecutarNomeArquivo: TStringField
      FieldName = 'NomeArquivo'
      Size = 200
    end
    object cdsScriptExecutarCaminhoCompleto: TStringField
      FieldName = 'CaminhoCompleto'
      Size = 8000
    end
  end
  object dsrScriptExecutar: TDataSource
    DataSet = cdsScriptExecutar
    Left = 824
    Top = 214
  end
  object pmPrincipal: TPopupMenu
    Left = 824
    Top = 265
    object mniMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = mniMarcarTodosClick
    end
    object mniDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = mniDesmarcarTodosClick
    end
  end
  object dlgPrincipal: TOpenDialog
    Left = 824
    Top = 313
  end
  object conPrincipal: TZConnection
    ControlsCodePage = cGET_ACP
    Catalog = ''
    AfterConnect = conPrincipalAfterConnect
    AfterDisconnect = conPrincipalAfterDisconnect
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = 'postgresql-9'
    Left = 832
    Top = 374
  end
  object conSecundaria: TZConnection
    ControlsCodePage = cGET_ACP
    Catalog = ''
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = ''
    Left = 831
    Top = 430
  end
  object zpPrincipal: TZSQLProcessor
    Params = <>
    DelimiterType = dtGo
    Delimiter = 'GO'
    Left = 744
    Top = 230
  end
  object qryPrincipal: TZQuery
    Params = <>
    Left = 744
    Top = 278
  end
  object il1: TImageList
    Left = 780
    Top = 72
  end
end
