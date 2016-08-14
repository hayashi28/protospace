# Protospace
====

## Database

- prototype
   - title       :string
   - catchcopy   :text
   - concept     :text
   - user_id     :integer

- comment
   - content      :text
   - user_id      :integer
   - prototype_id :integer

- user
   - nickname         :string
   - e-mail       :string
   - password     :string
   - member       :string
   - works        :string
   - avatar       :string
   - profile      :text

- image
   - image             :string
   - prototype_id    :integer
   - role            :integer

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







