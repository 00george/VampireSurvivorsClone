using Godot;
using System;

public partial class GameManager : Node
{
	
	public static GameManager Instance { get; private set; }

	public Node Player { get; set;}
	
	public override void _Ready()
	{
		Instance = this;
	}

	// Remove these gettters and setters later
	public Node GetPlayer(){
		return Player;
	}

	public void SetPlayer(Node player)
	{
		Player = player;
	}

}
