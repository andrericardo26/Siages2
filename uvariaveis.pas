unit uvariaveis;

interface
  Uses UPrincipal, Db;

type

  TImpressoras      =  Record
                         NOME      : String;
                         QTDLINHAS : Integer;
                         LINESPACE : Integer;
                         PORTA     : String;
                         PCOMPR175 : String;
                         TCOMPR175 : String;
                         PCOMPR20  : String;
                         TCOMPR20  : String;
                         PELITE12  : String;
                         TELITE12  : String;
                         PNEGRITO  : String;
                         TNEGRITO  : String;
                         PEXPAND   : String;
                         TEXPAND   : String;
                         P8LINPOL  : String;
                         T8LINPOL  : String;
                         PEJETAR   : String;
                         PLINPPAG  : String;
                       end;

  TUsuario          =  Record
                         Nome      : String;
                         Senha     : String;
                         Grupo     : String;
                       end;

  TParametros       =  Record
                         RAZAO_SOCIAL    : String;
                         ENDERECO        : String;
                         BAIRRO          : String;
                         CIDADE          : String;
                         CEP             : String;
                         FONE            : String;
                         FAX             : String;
                         IE              : String;
                         CGC             : String;
                         UF              : String;
                         PATHLOGO        : String;
                         PORTA           : String;
                         IMPR_FISCAL     : SmallInt;
                         IMPR_PADRAO     : SmallInt;
                         VENDA_PESO_LIQ  : SmallInt;
                         JUROS_DIARIO    : Double;
                         VERSAO_OFICIAL  : SmallInt;
                         GAVETA_DINHEIRO : Smallint;
                         VLR_TOTAL_POSTO : Smallint;
                         ALTERA_NOME_PROD: Smallint;
                         CAD_VEIC_MOTO   : Smallint;
                         COMPLE_PROD_NT  : Smallint;
                         MASCARA_VALOR   : String;
                         MASCARA_QTDE    : String;
                         BUSCA_CHAVE     : Smallint;
                         COL_IMPR_PED    : Smallint;
                         CAB_IMPR_PED    : Smallint;
                         ESP_IMPR_PED    : Smallint;
                         TOT_ORC_IMPR_PED: Smallint;
                         IMPR_PED_BALCAO : Smallint;
                         ALT_ESTQ_DIRETO : SmallInt;
                         RETEN_PISCOFINS : SmallInt;
                         RETEN_CSLL      : SmallInt;
                         RETEN_IRRF      : SmallInt;
                       end;

  TPesquisa         =  Record
                         //Tab_Cliente     : TClientDataSet;
                         Tab_Banco       : String;
                         Titulo          : String;
                         Campos_Pesquisa : Array [0..3] of String;
                         Condicao        : String;
                       end;

  TSQLs = record
        Pacientes           ,
        Clientes            ,
        Condicoes_Venda     ,
        Contas_Pagar        ,
        Contas_Receber      ,
        Empresas            ,
        Fornecedores        ,
        Grupos              ,
        Itens_Movimentos    ,
        Itens_Orcamentos    ,
        Marcas              ,
        Movimentos          ,
        Operacoes_Venda     ,
        Orcamentos          ,
        Parcelas_Movimentos ,
        Parcelas_Orcametos  ,
        Produtos            ,
        Sub_Grupos          ,
        Usuarios            ,
        Vendedores          : String;
  end;

  TPesquisas = record
              Cidades             ,
              Clientes            ,
              Condicoes_Venda     ,
              Contas_Pagar        ,
              Contas_Receber      ,
              Empresas            ,
              Fornecedores        ,
              Grupos              ,
              Itens_Movimentos    ,
              Itens_Orcamentos    ,
              Marcas              ,
              Movimentos          ,
              Operacoes_Venda     ,
              Vendas              ,
              Entradas            ,
              Parcelas_Movimentos ,
              Parcelas_Orcametos  ,
              Produtos            ,
              Sub_Grupos          ,
              Usuarios            ,
              Vendedores          : TPesquisa;
  end;

var
   SQLs            : TSQLs       ;
   Pesquisa_Master : TPesquisa   ;
   Ajustar_Pesquisa: TPesquisas  ;
   //Parametros
   Parametros      : TParametros ;
   //Acesso
   Usuario         : TUsuario    ;
   Impressoras     : Array of TImpressoras;
   Impressoras2     : Array of Integer;
Const
   Apelido = 'siages';

implementation

initialization
   //Acesso
   Usuario.Nome  := Apelido;
   Usuario.Senha := Apelido;

                                                  
  //Sqls de pesquisa
  with SQLs do begin
       Pacientes                  := 'SELECT * FROM Pacientes            WHERE Codigo           IS NULL';
       Clientes                   := 'SELECT * FROM Clientes             WHERE Cliente_id       IS NULL';
       Condicoes_Venda            := 'SELECT * FROM Condicoes_Venda      WHERE Condicao_id      IS NULL';
       Contas_Pagar               := 'SELECT * FROM Contas_Pagar         WHERE Conta_Pagar_id   IS NULL';
       Contas_Receber             := 'SELECT * FROM Contas_Receber       WHERE Conta_Receber_id IS NULL';
       Empresas                   := 'SELECT * FROM Empresas             WHERE Empresa_id       IS NULL';
       Fornecedores               := 'SELECT * FROM Fornecedores         WHERE Fornecedor_id    IS NULL';
       Grupos                     := 'SELECT * FROM Grupos               WHERE Grupo_id         IS NULL';
       Itens_Movimentos           := 'SELECT * FROM Itens_Movimentos     WHERE Movimento_id     IS NULL';
       Itens_Orcamentos           := 'SELECT * FROM Itens_Orcamentos     WHERE Orcamento_id     IS NULL';
       Marcas                     := 'SELECT * FROM Marcas               WHERE Marca_id         IS NULL';
       Movimentos                 := 'SELECT * FROM Movimentos           WHERE Movimento_id     IS NULL';
       Operacoes_Venda            := 'SELECT * FROM Operacoes_Venda      WHERE Operacao_id      IS NULL';
       Parcelas_Movimentos        := 'SELECT * FROM Parcelas_Movimentos  WHERE Movimento_id     IS NULL';
       Parcelas_Orcametos         := 'SELECT * FROM Parcelas_Orcametos   WHERE Orcameto_id      IS NULL';
       Produtos                   := 'SELECT * FROM Produtos             WHERE Produto_id       IS NULL';
       Sub_Grupos                 := 'SELECT * FROM Sub_Grupos           WHERE Sub_Grupo_id     IS NULL';
       Usuarios                   := 'SELECT * FROM Usuarios             WHERE Usuario_id       IS NULL';
       Vendedores                 := 'SELECT * FROM Vendedores           WHERE Vendedor_id      IS NULL';
  end;


end.
