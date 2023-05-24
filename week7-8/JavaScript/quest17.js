class Playlist {
  constructor(name) {
    this.name = name;
    this.songs = [];
  }

  addSong(song) {
    this.songs.push(song);
  }

  removeSong(song) {
    const index = this.songs.indexOf(song);
    if (index !== -1) {
      this.songs.splice(index, 1);
    }
  }

  play() {
    if (this.songs.length > 0) {
      const currentSong = this.songs[0];
      return `再生中: ${currentSong}`;
    } else {
      return '再生中の曲はありません';
    }
  }
}

let myPlaylist = new Playlist('お気に入りリスト');
myPlaylist.addSong('Lemon');
myPlaylist.addSong('花束');
console.log(myPlaylist.play()); // 再生中: Lemon
myPlaylist.removeSong('Lemon');
console.log(myPlaylist.play()); // 再生中：花束