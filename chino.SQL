1ºSELECT FirstName, LastName from employees
ORDER by LastName ASC

2ºSELECT t.name, t.Milliseconds FROM tracks t
INNER JOIN albums a on t.AlbumId = a.AlbumId
WHERE a.Title like "big ones" 
ORDER by t.Milliseconds DESC;

3º SELECT count(t.name) AS terror, g.name FROM tracks t
INNER JOIN genres g on g.GenreId = t.GenreId
GROUP by g.GenreId

4º SELECT count(tracks.AlbumId) AS jaja, albums.Title FROM tracks
INNER JOIN albums on albums.AlbumId = tracks.AlbumId
GROUP by tracks.AlbumId
HAVING jaja > 5

5º select Title, total from albums a
INNER JOIN tracks t ON a.AlbumId =t.AlbumId
INNER JOIN invoice_items it ON t.TrackId = it.TrackId
INNER JOIN invoices i ON i.InvoiceId = it.InvoiceId
ORDER BY total asc 
LIMIT 10 

6º select  t.name, Title,g.name, total from albums a
INNER JOIN tracks t ON a.AlbumId =t.AlbumId
INNER JOIN invoice_items it ON t.TrackId = it.TrackId
INNER JOIN invoices i ON i.InvoiceId = it.InvoiceId
INNER JOIN genres g on g.GenreId = t.GenreId
WHERE total == 0.99

7º SELECT Milliseconds,t.name as titulo , g.name as genero, al.Title as nombre_album , ar.name as artistas from tracks t
INNER JOIN genres g ON g.GenreId = t.GenreId
INNER JOIN albums al on al.AlbumId = t.AlbumId
INNER JOIN artists ar on ar.ArtistId = al.ArtistId
ORDER by Milliseconds ASC
limit 20;
8º SELECT e.LastName AS Empleado_Apellido, e.Title AS Puesto, r.LastName AS Jefe_Apellido, COUNT(c.CustomerId) AS Cantidad_Clientes FROM employees e
INNER join employees r on e.ReportsTo = r.EmployeeId
INNER JOIN customers c on c.SupportRepId = e.EmployeeId
GROUP BY e.EmployeeId
ORDER BY Cantidad_Clientes