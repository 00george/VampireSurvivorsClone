using Godot;
using System;

public partial class Menu : Control
{
	
	private Control _menuGroup;

	public override void _Ready()
	{
		GetNode<Button>("MainMenuMarginContainer/VBoxContainer/Start").GrabFocus();
		_menuGroup = GetParent<Control>();
	}

	public void OnStartPressed()
	{
		_menuGroup.GetNode<Control>("CharacterSelection").Show();
		Hide();
	}

	public void OnOptionsPressed()
	{
		_menuGroup.GetNode<Control>("Options").Show();
		Hide();
	}

	public void OnExitPressed()
	{
		GetTree().Quit();
	}
}
