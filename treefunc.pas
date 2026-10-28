unit TreeFunc;

{$MODE Delphi}

interface

uses
  LCLIntf, SysUtils, Classes, Graphics, ComCtrls, DB, Forms, Dialogs;

function  TreeFindItem(Sender: TTreeView; NodeItem: TTreeNode; Name: String): TTreeNode;
function  TreeAddItem(Sender: TTreeView; ItemList: TStrings; Bookmark: TBookmark; Resort: Boolean): TTreeNode;
function  TreeGetItem(Sender: TTreeView; ItemList: TStrings): TTreeNode;
procedure TreeDeleteItem(Sender: TTreeView; ItemList: TStrings; Level: Integer);

implementation


function TreeAddItem(Sender: TTreeView; ItemList: TStrings; Bookmark: TBookmark; Resort: Boolean): TTreeNode;
var
   ThisNode, Node: TTreeNode;
   I: Integer;
begin
     Node := nil;   //nil = level 0 has no parent node
                    //this is checked by TreeFindItem
     for I := 0 to Itemlist.count -1 do
     begin
          ThisNode := TreeFindItem(Sender, node, Itemlist[i]);
          if ThisNode <> nil then Node := ThisNode else
          begin
               if I < Itemlist.count -1 then
               begin
                    if I = 0 then Node := Sender.items.Add(Node, Itemlist[i])
                    else Node := Sender.items.AddChild(Node, Itemlist[i]);
               end else
               begin
                    if I = 0 then Node := Sender.items.AddObject(Node, Itemlist[i], Bookmark)
                    else Node := Sender.items.AddChildObject(Node, Itemlist[i], Bookmark);
               end;
               Node.stateIndex := Node.level + 1;
               if Resort and (Node.parent <> nil) then Node.parent.alphasort; 
          end;
     end;
     Result := Node;
end;

function TreeFindItem(Sender: TTreeView; NodeItem: TTreeNode; Name: String): TTreeNode;
begin
     if NodeItem = nil then NodeItem := Sender.items.getfirstnode
     else NodeItem := NodeItem.getfirstchild;
//NodeItem is now the first item of the desired level
//if this level has no items, NodeItem is nil

     if (NodeItem <> nil) and (NodeItem.text <> Name) then
     repeat
           NodeItem := NodeItem.getnextsibling;
     until (NodeItem = nil) or (NodeItem.text = Name);
     Result := NodeItem;
end;

function TreeGetItem(Sender: TTreeView; ItemList: TStrings): TTreeNode;
begin
     Result := TreeAddItem(Sender, Itemlist, nil, false);
end;

procedure TreeDeleteItem(Sender: TTreeView; ItemList: TStrings; Level: Integer);
var
   Node, Parent: TTreeNode;
begin
     Node := TreeGetItem(Sender, ItemList);
     while Node.level >= Level do
     begin
          Parent := Node.parent;
          Node.delete;
          if (Parent = nil) or (Parent.hasChildren) then break;
          Node := Parent;
     end;
end;


end.
