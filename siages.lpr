program siages;

{$MODE Delphi}

uses
  {cThreads,} Interfaces, Forms, Classes, SysUtils, LResources, Controls, Graphics,
  Dialogs, uprincipal, UMarca, usplash, uSenha, UGrupo, uconfbase, uvariaveis,
  USubGrupo, USituTrib, UTribProd, TreeFunc, UConsulta, UProduto, global,
  UVendedor, UFornec, UPraca, USituacaoClientes, UClassClientes, UAtividade,
  UClientes, UTransportador, UObserv, UCodFiscais, UGeraParc, UVendasLen,
  UImpressoras, UParametros, UCatSubcat, UCtaReceber, UMovt_Caixa, UBancos,
  UCtaCorrente, UMovt_Bancos, UCtaPagar,
  UFormPagto, UConfigDoc, UQuit_Mult_Ctas, UConsulta_Precos,
  UAjuste, UReajuste, UultCompras, UCompras2, usobre, UVendas,uSobre3{, uSenha3};

begin
   Application.Initialize;
   FrmSplash := TFrmSplash.Create(Application);
   FrmSplash.Show;
   FrmSplash.Refresh;
   Application.Processmessages;
   Application.CreateForm(TFrmPrincipal, FrmPrincipal);
   Frmsplash.Close;
   FrmSplash.Free;
   Application.Run;
end.

