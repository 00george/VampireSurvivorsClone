using Godot;
using System;

public partial class GameManager : Node
{
	
	public static GameManager Instance { get; private set; }

	public CharacterBody2D Player { get; set;}
	
	public override void _Ready()
	{
		Instance = this;
	}

	// Remove these gettters and setters later
	public CharacterBody2D GetPlayer(){
		return Player;
	}

	public void SetPlayer(CharacterBody2D player)
	{
		Player = player;
	}

}
