using Godot;
using System;
using System.Collections.Generic;
using System.Data;

public partial class CharacterSelection : Control
{
	
	[Export]
	private Godot.Collections.Array<PackedScene> CharacterScenes;

	private Dictionary<String, String> _playerToIcon = new Dictionary<String, String>();

	private ItemList _characterList;

	private AudioStreamPlayer2D _music;

	private const String _level1Path = "res://levels/level1.tscn";

	public override void _Ready()
	{
		_playerToIcon.Add("Becky", "res://characters/players/becky_player/character_selection.tres");
		_playerToIcon.Add("Chris", "res://characters/players/chris_player/character_selection.tres");

		_characterList = GetNode<ItemList>("MarginContainer/VBoxContainer/CharacterList");
		_music = GetNode<AudioStreamPlayer2D>("../../Music");

		foreach(KeyValuePair<String, String> entry in _playerToIcon)
		{
			_characterList.AddItem(entry.Key, GD.Load<Texture2D>(entry.Value));
		}
	}
	
	private void _on_start_pressed()
	{
		int[] SelectedItems = _characterList.GetSelectedItems();
		if(SelectedItems.Length > 0)
		{
			foreach(Control MenuNode in GetTree().GetFirstNodeInGroup("MenusGroup").GetChildren())
			{
				MenuNode.Hide();
			}
			_music.Stop();
			GameManager.Instance.SetPlayer((CharacterBody2D) CharacterScenes[SelectedItems[0]].Instantiate());
			GetTree().Paused = false;
			GetTree().GetFirstNodeInGroup("LevelsGroup").AddChild(GD.Load<PackedScene>(_level1Path).Instantiate());
		}

	}
	
}
