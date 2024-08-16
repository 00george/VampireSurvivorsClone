using Godot;
using System;

public partial class BasicEnemy : CharacterBody2D
{

	[Export]
	private float _health = 2f;

	[Export]
	private float _speed = 130;

	[Export]
	private CharacterStats _characterStats;

	[Export]
	private String _smokeEffectUID = "uid://dhmhmrth6rdce";

	[Export]
	private String _expOrbUID = "uid://twcwtq630jx6";

	private AnimatedSprite2D _sprite2D;

	private Node2D _player;

	private PackedScene _smokeEffectScene;

	private PackedScene _expOrbScene;

	public override void _Ready()
	{
		_sprite2D = GetNode<AnimatedSprite2D>("sprite");
		_player = (Node2D) GameManager.Instance.GetPlayer();
		_smokeEffectScene = GD.Load<PackedScene>(_smokeEffectUID);
		_expOrbScene = GD.Load<PackedScene>(_expOrbUID);
	}

	public void TakeDamage()
	{
		_health -= 1 * (2 / (_characterStats.Defence + 1));

		if(_health <= 0)
		{
			QueueFree();
			Node2D Smoke = (Node2D) _smokeEffectScene.Instantiate();
			ExpOrb ExpOrb = (ExpOrb) _expOrbScene.Instantiate();

			GetParent().CallDeferred("add_child", Smoke);
			GetParent().CallDeferred("add_child", ExpOrb);

			Smoke.GlobalPosition = GlobalPosition;
			ExpOrb.GlobalPosition = GlobalPosition;
		}
	}

	public override void _Process(double delta)
	{
		moveTowardsPlayer(delta);
	}

	private void moveTowardsPlayer(double delta)
	{
		Vector2 Direction = GlobalPosition.DirectionTo(_player.GlobalPosition);

		if(Direction.X < 0)
		{
			_sprite2D.FlipH = true;
		}
		else if(Direction.X > 0)
		{
			_sprite2D.FlipH = false; 
		}

		Vector2 Velocity = Direction * _speed * _characterStats.Speed;
		MoveAndCollide(Velocity * (float) delta);
	}
}
