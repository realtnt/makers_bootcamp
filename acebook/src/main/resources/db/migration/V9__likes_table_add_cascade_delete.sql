ALTER TABLE likes
DROP CONSTRAINT likes_post_id_fkey;

ALTER TABLE likes ADD FOREIGN KEY (post_id)
REFERENCES posts(id) ON DELETE CASCADE;