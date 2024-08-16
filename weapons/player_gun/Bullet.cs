using Godot;
using System;

public partial class Bullet : Area2D
{
	
	private float _travelledDistance;

	[Export]
	private float _bulletSpeed = 1000f;

	[Export]
	private float _range = 1200f;

	public override void _PhysicsProcess(double delta)
	{
		Vector2 Direction = Vector2.Right.Rotated(Rotation);
		Position += Direction * _bulletSpeed * (float) delta;
		_travelledDistance += _bulletSpeed * (float) delta;

		if(_travelledDistance > _range)
		{
			QueueFree();
		}

	}
	
	public void OnBodyEntered(Node body)
	{
		QueueFree();
		if(body is BasicEnemy basicEnemy)
		{
			basicEnemy.TakeDamage();
		}
	}
	
}
