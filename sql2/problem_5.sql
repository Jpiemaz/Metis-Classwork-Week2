SELECT galleries.id
FROM galleries
INNER JOIN images
ON images.gallery_id = galleries.id
GROUP BY galleries.id
ORDER BY count(images) DESC
LIMIT 1;