SELECT count(images), galleries.name
FROM galleries
INNER JOIN images
ON images.gallery_id = galleries.id
WHERE images.name ILIKE 'sushi%'
GROUP BY galleries.id;
