SELECT count(images), galleries.name
FROM galleries
INNER JOIN images
ON images.gallery_id = galleries.id
GROUP BY galleries.id;