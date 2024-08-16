using Godot;
using System;

public partial class Inventory : Node
{

    public void AddWeapon(Node2D weapon)
    {
        GameManager.Instance.GetPlayer().AddChild(weapon);
    }

}