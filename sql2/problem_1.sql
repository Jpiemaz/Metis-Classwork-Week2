SELECT galleries.name
FROM images
JOIN galleries
ON images.gallery_id = galleries.id
WHERE images.name ILIKE 'Grumpy%'
Group by galleries.id;