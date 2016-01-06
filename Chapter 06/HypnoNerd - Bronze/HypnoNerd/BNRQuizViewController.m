#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
@property (nonatomic) int currentQuestionIndex;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

- (IBAction)showQuestoin:(UIButton *)sender;
- (IBAction)showAnswer:(UIButton *)sender;

@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        _questions = @[@"Who is the president of the U.S.?",
                       @"What car does Tesla Motors make?",
                       @"Who invented an iPhone?"];
        _answers = @[@"Barack Obama",
                     @"Model S",
                     @"Steve Jobs"];
        _currentQuestionIndex = -1;
        
        self.tabBarItem.title = @"Quiz";
        
        UIImage *image = [UIImage imageNamed:@"Ask.png"];
        self.tabBarItem.image = image;
    }
    
    return self;
}

- (IBAction)showQuestoin:(UIButton *)sender {
    self.currentQuestionIndex++;
    
    if (self.currentQuestionIndex == self.questions.count) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *str = self.questions[self.currentQuestionIndex];
    
    self.questionLabel.text = str;
    
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(UIButton *)sender {
    self.answerLabel.text = self.answers[self.currentQuestionIndex];
}
@end
