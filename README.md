Protospace
====

## Database

- prototype
   - catchcopy :text
   - concept :text
   - image :text

- comment
   - content :text
   - user_id :integer
   - prototype_id :integer
   - created_at :text
   - uploaded_at :text

- user
   - name :text
   - email_address :text
   - password :text
   - prototype_id :integer
   - comment_id :integer

# Association

- prototype
   - has_many :comments
   - belongs_to :user

- comment
   - belongs_to :prototype
   - belongs_to :user

- user
   - has_many :prototypes
   - has_many :comments
