using Godot;
using System;

public partial class PlayerHealth : Node
{

	[Export(PropertyHint.File, "*.tscn")]
	String MainMenuScenePath;

	[Signal]
	public delegate void HealthDepletedEventHandler();

	private float _health = 100.0f;

	private float _max_health = 100.0f;

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
		// TODO: This sucks ass
		Godot.Collections.Array<Node2D> OverlappingMobs = _hurtBox.GetOverlappingBodies();

		if(OverlappingMobs.Count > 0)
		{
			float DamageMultiplier = 2 / (_characterStats.Defence + 1);

			// Its possible that DamageToTake is under 1 due to delta.
			float DamageToTake = MathF.Ceiling(_damageRate * DamageMultiplier * OverlappingMobs.Count * (float) delta);
			
			ChangeHealth(-DamageToTake);

			if(_health <= 0.0)
			{
				GetTree().ChangeSceneToFile(MainMenuScenePath);
				EmitSignal(SignalName.HealthDepleted);
			}
		}
	}

	public void ChangeHealth(float amount)
	{
		float NewHealthValue = _health + amount;
		if(NewHealthValue >= _max_health)
		{
			_health = _max_health;
		}
		else
		{
			_health += amount;
		}

		PlayerIngameUI.Instance.SetHealthBar(_health, _max_health);
	}

}
