# Protospace
====

## Database

- prototype
   - title       :text
   - catchcopy   :text
   - concept     :text
   - user_id     :integer

- comment
   - content      :text
   - user_id      :integer
   - prototype_id :integer

- user
   - name         :text
   - e-mail       :text
   - password     :text
   - member       :text
   - works        :text
   - avatar       :text
   - profile      :text

- image
   - url             :text
   - prototype_id    :integer
   - roll            :integer

- like
   - prototype_id :integer
   - user_id      :integer

## Association

- prototype
   - has_many   :comments
   - belongs_to :user
   - has_many   :images
   - has_many   :likes

- comment
   - belongs_to :prototype
   - belongs_to :user

- user
   - has_many :prototypes
   - has_many :comments
   - has_many :images
   - has_many :likes

- image
   - belongs_to :user
   - belongs_to :prototype

- like
   - belongs_to :user
   - belongs_to :prototype







