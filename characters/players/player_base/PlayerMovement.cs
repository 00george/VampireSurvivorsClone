using Godot;
using System;

public partial class PlayerMovement : Node
{

	private int _speed = 200;

	private AnimatedSprite2D _animatedSprited2d;

	public CharacterBody2D _characterBody2d;

	private CharacterStats _characterStats;

	public override void _Ready()
	{
		_animatedSprited2d = GetParent<PlayerBase>().AnimatedSprite;
		_characterBody2d = GetParent<PlayerBase>().CharacterBody;
		_characterStats = GetParent<PlayerBase>().CharacterStats;
	}

	public override void _PhysicsProcess(double delta)
	{
		Vector2 Direction = Input.GetVector("move_left", "move_right", "move_up", "move_down");
		if(Direction == Vector2.Left)
		{
			_animatedSprited2d.Play("run_left");
		}
		if(Direction == Vector2.Right)
		{
			_animatedSprited2d.Play("run_right");
		}
		if(Direction == Vector2.Up)
		{
			_animatedSprited2d.Play("run_up");
		}
		if(Direction == Vector2.Down)
		{
			_animatedSprited2d.Play("run_down");
		}
		if(Direction == new Vector2(-0.5F, -0.5F))
		{
			_animatedSprited2d.Play("run_left");
		}
		if(Direction == new Vector2(0.5F, 0.5F))
		{
			_animatedSprited2d.Play("run_right");
		}
		if(Direction == Vector2.Zero)
		{
			_animatedSprited2d.Play("run_down");
		}

		_characterBody2d.MoveAndCollide(Direction * _speed * (float) delta * (float) _characterStats.Speed);
	}
}
