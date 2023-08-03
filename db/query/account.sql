-- name: CreateAccount :one
INSERT INTO accounts (
  owner,
  blance,
  currency
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetAccount :one
SELECT * FROM accounts
WHERE id = $1 LIMIT 1;

-- name: ListAccount :many
SELECT * FROM accounts
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateAccount :one
UPDATE accounts
SET blance = $2
WHERE id = $1
RETURNING *; 

-- name: DeleteACCOUNT :exec
DELETE FROM accounts
WHERE id = $1;