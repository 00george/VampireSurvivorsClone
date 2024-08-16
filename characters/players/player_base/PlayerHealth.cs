using Godot;
using System;

public partial class PlayerHealth : Node
{

	[Export(PropertyHint.File, "*.tscn")]
	String MainMenuScenePath;

	public const string HealthDepletedSignal = "health_depleted";

	private float _health = 100.0f;

	private const float _damageRate = 20.0f;

	private Area2D _hurtBox;

	private CharacterStats _characterStats;

	 public override void _Ready()
	{
		_hurtBox = GetParent<PlayerBase>().HurtBox;
		_characterStats = GetParent<PlayerBase>().CharacterStats;
	}

	public override void _PhysicsProcess(double delta)
	{
		Godot.Collections.Array<Node2D> OverlappingMobs = _hurtBox.GetOverlappingBodies();

		if(OverlappingMobs.Count > 0)
		{
			float DamageMultiplier = 2 / (_characterStats.Defence + 1);
			_health -= _damageRate * OverlappingMobs.Count * (float) delta * DamageMultiplier;

			if(_health <= 0.0)
			{
				GetTree().ChangeSceneToFile(MainMenuScenePath);
				EmitSignal(HealthDepletedSignal);
			}
		}
	}

	public void ChangeHealth(int amount)
	{
		_health += amount;
	}
}
