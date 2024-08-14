using Godot;
using System;

public partial class PlayerBase : Node
{
	
	[Export]
	public AnimatedSprite2D AnimatedSprite { get; set; }

	[Export] 
	public Area2D HurtBox { get; set; }

	[Export]
	public CharacterStats CharacterStats { get; set; }

	[Export]
	public CharacterBody2D CharacterBody { get; set; }

	private PlayerHealth _playerHealth;

	private PlayerMovement _playerMovement;

	private PlayerExp _playerExp;

	public override void _Ready()
	{
		_playerHealth = GetNode<PlayerHealth>("PlayerHealth");
		_playerMovement = GetNode<PlayerMovement>("PlayerMovement");
		_playerExp = GetNode<PlayerExp>("PlayerExp");
	}

	public void GainExp(int amount)
	{
		_playerExp.GainExp(amount, CharacterStats.ExpGain);
	}

}
