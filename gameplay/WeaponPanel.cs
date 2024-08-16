using Godot;
using System;

public partial class WeaponPanel : Node
{

	private const String _weaponPanelPath = "res://gameplay/weapon_panel.tscn";

	public static Node2D Weapon;

	[Signal]
	public delegate void WeaponSelectedEventHandler();

	public static WeaponPanel CreateWeaponPanel(Node2D weapon)
	{
		Weapon = weapon;
		WeaponPanel weaponPanel = (WeaponPanel) GD.Load<PackedScene>(_weaponPanelPath).Instantiate();
		WeaponInformation weaponInformation = weapon.GetNode<Weapon>("Weapon").WeaponInformation;

		// Set child nodes
		weaponPanel.GetNode<Label>("MarginContainer/Background/Name").Text = weaponInformation.WeaponName;
		weaponPanel.GetNode<TextureRect>("MarginContainer/Background/Icon").Texture = weaponInformation.WeaponIcon;
		weaponPanel.GetNode<Label>("MarginContainer/Background/Description").Text = weaponInformation.WeaponDescription;

		return weaponPanel;
	}

	public void _on_button_pressed()
	{
		Inventory inventory = GameManager.Instance.GetPlayer().GetNode<Inventory>("Inventory");
		inventory.AddWeapon(Weapon);
		EmitSignal(SignalName.WeaponSelected);
	}
	
}
