using Godot;
using System;
using System.Collections.Generic;

public partial class PlayerIngameUI : GridContainer
{	

	private Godot.Collections.Dictionary<String, String> _playerToUI = new Godot.Collections.Dictionary<String, String>();

	public static PlayerIngameUI Instance { get; private set; }

	private CharacterBody2D _player;

	private PlayerResourceUI _playerResource;

	private TextureRect _icon;

	private ProgressBar _healthBar;

	private Label _healthText;

	private ProgressBar _expBar;

	private Label _expText;

	public override void _Ready()
	{
		Instance = this;
		
		// Do better :(
		_playerToUI.Add("BeckyPlayer", "uid://tg1mu00dxxch");
		_playerToUI.Add("ChrisPlayer", "uid://dg07rm64pvrmj");

		_icon = GetNode<TextureRect>("MarginContainer/Icon");
		_healthBar = GetNode<ProgressBar>("VBoxContainer/TopBar/HealthBar");
		_healthText = GetNode<Label>("VBoxContainer/TopBar/HealthText");
		_expBar = GetNode<ProgressBar>("VBoxContainer/BottomBar/ExpBar");
		_expText = GetNode<Label>("VBoxContainer/BottomBar/ExpText");

		_player = GameManager.Instance.GetPlayer();
		_playerResource = GD.Load<PlayerResourceUI>(_playerToUI.GetValueOrDefault(_player.Name));

		_icon.Texture = _playerResource.Icon;

		// TODO: Init using player stats of selected character
		// There is a race condition if you try to get the Instance of the player from the GameManager
		_healthText.Text = 100 + "/" + 100;
		_healthBar.Value = 100;
		_healthBar.MaxValue = 100;

		_expText.Text = 0 + "/" + 20;
		_expBar.Value = 0;
		_expBar.MaxValue = 20;
	}

	public void SetHealthBar(float health, float maxHealth)
	{
		_healthText.Text = health + "/" + maxHealth;
		_healthBar.Value = health;
		_healthBar.MaxValue = maxHealth;

	}

	public void SetExpBar(float exp, float maxExp)
	{
		_expText.Text = exp + "/" + maxExp;
		_expBar.Value = exp;
		_expBar.MaxValue = maxExp;
	}

}
