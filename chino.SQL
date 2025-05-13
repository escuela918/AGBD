1ºSELECT FirstName, LastName from employees
ORDER by LastName ASC

2ºSELECT t.name, t.Milliseconds FROM tracks t
INNER JOIN albums a on t.AlbumId = a.AlbumId
WHERE a.Title like "big ones" 
ORDER by t.Milliseconds DESC;

3º SELECT count(t.name) AS terror, g.name FROM tracks t
INNER JOIN genres g on g.GenreId = t.GenreId
GROUP by g.GenreId