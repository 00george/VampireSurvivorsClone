using Godot;
using System;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;

public partial class LevelUpManger : Node
{

	private CanvasLayer _ui;

	private VFlowContainer _optionsContainer;
	
	[Export]
	private Godot.Collections.Array<PackedScene> Weapons;

	public override void _Ready()
	{
		_ui = GetNode<CanvasLayer>("CanvasLayer");
		_optionsContainer = GetNode<VFlowContainer>("CanvasLayer/VFlowContainer");
	}


	public void OnLevelUp()
	{
		CharacterBody2D Player = (CharacterBody2D) GameManager.Instance.GetPlayer();
		GetTree().Paused = true;
		CreateDisplay();
		_ui.Show();

	}

	private void CreateDisplay()
	{
		for(int i=0; i<3; i++)
		{
			Node2D RandomWeapon = (Node2D) Weapons.PickRandom().Instantiate();
			WeaponPanel weaponPanel = WeaponPanel.CreateWeaponPanel(RandomWeapon);

			_optionsContainer.AddChild(weaponPanel);
			weaponPanel.Connect("WeaponSelected", Callable.From(_on_weapon_selected));
		}
	}

	public void _on_weapon_selected()
	{
		_ui.Hide();
		foreach(WeaponPanel weaponOption in _optionsContainer.GetChildren())
		{
				_optionsContainer.RemoveChild(weaponOption);
				weaponOption.QueueFree();
		}
		GetTree().Paused = false;
	} 

}
