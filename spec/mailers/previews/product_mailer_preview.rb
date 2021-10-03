# Preview all emails at http://localhost:3000/rails/mailers/product_mailer
class ProductMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/product_mailer/product_created
  def product_created
    # ProductMailer.product_created
    user = User.first_or_create(
      name: 'testUser',
      email: 'saiful@gmail.com',
      password: '111111'
    )
    product = Product.first_or_create(
      user_id: user.id,
      name: 'testUser',
      price: 120_000,
      category: 'minuman'
    )

    image_file = {
      filename: 'testfile.jpg',
      file: 'data:image/jpeg;base64,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'
    }

    Product.upload_image_file_by_blog(product, OpenStruct.new(image_file))

    ProductMailer.with(object: product).product_created
  end
end
