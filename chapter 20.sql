

--1.Query all of the entries in the Genre table

SELECT * from Genre

--2.Query all the entries in the Artist table and order
--by the artist's name. HINT: use the ORDER BY keywords

SELECT ArtistName from Artist 
Order By ArtistName Asc;


--3.Write a SELECT query that lists all the songs in 
--the Song table and include the Artist name

Select 
song.Title,
artist.ArtistName
from Song song
Left Join Artist artist on song.ArtistId = artist.id;


 --4.Write a SELECT query that lists all the Artists that have a Pop Album

 Select *  from Album 
 Where GenreId = 7;

 ----5.Write a SELECT query that lists all the Artists that 
 --have a Jazz or Rock Album

  Select * from Album
 Where GenreId = 4 OR GenreId =2;
 
 --6. Write a SELECT statement that lists the Albums with no songs
 
 Select * from Album
 Where title IS NUll;

 --7. Using the INSERT statement, add one of your favorite artists 
 --to the Artist table.

--Insert INTO Artist (ArtistName, YearEstablished ) VALUES ('Justin Timberlake', '2009');
 
 --8.Using the INSERT statement, add one, or more, albums by your artist to the Album table.
 
 --INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Man of the Woods', '02/02/2018', 3954, 'RCA', 31, 7);

--9.Using the INSERT statement, add some songs that are on that album to the Song table.

--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Morning Light', 278, '02/02/2018', 7, 31, 29);

--10.Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and 
--the WHERE keyword to filter the results to the album and artist you added.

Select Song.Title, Album.title, Artist.ArtistName 
from Album 
LEFT JOIN Song ON Song.AlbumId = Album.Id
LEFT JOIN Artist ON Song.ArtistId = Artist.Id
WHERE Album.Title = 'Man of the Wood';

--11.Write a SELECT statement to display how many songs exist for each 
--album. You'll need to use the COUNT() 
--function and the GROUP BY keyword sequence.
Select COUNT (Album.title), Album.Title
FROM Song
LEFT JOIN Album ON Song.AlbumId = Album.Id
GROUP BY Album.Title;

--12.Write a SELECT statement to display how many songs exist for each artist. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
Select COUNT (Artist.ArtistName), Artist.ArtistName
FROM Song
LEFT JOIN Artist ON Song.ArtistId = Artist.Id
GROUP BY ArtistName;

--13.Write a SELECT statement to display how many songs exist for each genre. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
 Select COUNT (GenreId), Genre.label
FROM Song
LEFT JOIN Genre ON Song.GenreId = Genre.Id
GROUP BY Genre.label;

--14.Write a SELECT query that lists the Artists that have put out records on 
--more than one record label. Hint: When using GROUP BY instead of 
--using a WHERE clause, use the HAVING keyword
select artist.artistname 
from album 
left join artist on album.artistid = artist.id
group by artist.artistname
having count(distinct label) > 1;

--15.Using MAX() function, write a select statement to find the album with the longest duration. 
--The result should display the album title and the duration.
SELECT Title, AlbumLength
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album)

--16.Using MAX() function, write a select statement to find the song with the longest duration. 
--The result should display the song title and the duration.

SELECT Title, SongLength
FROM Song
WHERE SongLength = (SELECT MAX(SongLength) FROM Song);

--17.Modify the previous query to also display the title of the album.
SELECT Song.Title, SongLength, Album.Title
FROM Song
LEFT JOIN Album ON Song.AlbumId = Album.Id
WHERE SongLength = (SELECT MAX(SongLength) FROM Song);














